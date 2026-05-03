#!/usr/bin/env python3
"""Import Spanish vehicle workshops from OpenStreetMap Overpass.

Outputs:
- data/workshops-osm-spain.json
- supabase/seeds/workshops_from_osm_spain.sql

Run a small smoke test:
  python3 scripts/import_osm_workshops.py --bbox 41.30,2.05,41.48,2.25 --limit 25

Run Spain import:
  python3 scripts/import_osm_workshops.py

The generated SQL is intended for Supabase SQL Editor. It upserts workshops by
slug and stores the OSM element id in workshop_external_ids.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path
from typing import Any


OVERPASS_URL = "https://overpass-api.de/api/interpreter"
ROOT = Path(__file__).resolve().parents[1]
JSON_OUTPUT = ROOT / "data" / "workshops-osm-spain.json"
SQL_OUTPUT = ROOT / "supabase" / "seeds" / "workshops_from_osm_spain.sql"
CHUNKS_DIR = ROOT / "supabase" / "seeds" / "workshops_osm_chunks"


SERVICE_TAG_MAP = {
    "service:vehicle:tyres": "tyres",
    "service:vehicle:inspection": "itv_prep",
    "service:vehicle:electrical": "electric_hybrid",
    "service:vehicle:glass": "glass",
    "service:vehicle:air_conditioning": "air_conditioning",
    "service:vehicle:brakes": "brakes",
    "service:vehicle:car_repair": "mechanical_repair",
    "service:vehicle:truck_repair": "mechanical_repair",
}


def slugify(value: str) -> str:
    value = value.strip().lower()
    replacements = {
        "á": "a",
        "à": "a",
        "ä": "a",
        "â": "a",
        "é": "e",
        "è": "e",
        "ë": "e",
        "ê": "e",
        "í": "i",
        "ï": "i",
        "ó": "o",
        "ò": "o",
        "ö": "o",
        "ô": "o",
        "ú": "u",
        "ü": "u",
        "ñ": "n",
        "ç": "c",
    }
    for source, target in replacements.items():
        value = value.replace(source, target)
    value = re.sub(r"[^a-z0-9]+", "-", value)
    return re.sub(r"-+", "-", value).strip("-")


def sql_quote(value: str | None) -> str:
    if value is None or value == "":
        return "null"

    return "'" + value.replace("'", "''") + "'"


def sql_json(value: Any) -> str:
    return sql_quote(json.dumps(value, ensure_ascii=False, sort_keys=True)) + "::jsonb"


def build_query(bbox: str | None) -> str:
    if bbox:
        south, west, north, east = bbox.split(",")
        scope = f"({south},{west},{north},{east})"
        area_header = ""
    else:
        scope = "(area.searchArea)"
        area_header = 'area["ISO3166-1"="ES"][admin_level=2]->.searchArea;'

    return f"""
[out:json][timeout:900][maxsize:1073741824];
{area_header}
(
  node["shop"="car_repair"]{scope};
  way["shop"="car_repair"]{scope};
  relation["shop"="car_repair"]{scope};
  node["shop"="tyres"]{scope};
  way["shop"="tyres"]{scope};
  relation["shop"="tyres"]{scope};
  node["service:vehicle:car_repair"="yes"]{scope};
  way["service:vehicle:car_repair"="yes"]{scope};
  relation["service:vehicle:car_repair"="yes"]{scope};
);
out center tags;
"""


def fetch_overpass(query: str) -> dict[str, Any]:
    data = urllib.parse.urlencode({"data": query}).encode("utf-8")
    request = urllib.request.Request(
        OVERPASS_URL,
        data=data,
        headers={
            "User-Agent": "TallerMatch/0.1 workshop importer",
            "Content-Type": "application/x-www-form-urlencoded",
        },
    )

    with urllib.request.urlopen(request, timeout=960) as response:
        return json.loads(response.read().decode("utf-8"))


def normalize_elements(payload: dict[str, Any], limit: int | None) -> list[dict[str, Any]]:
    workshops = []
    seen_external_ids = set()

    for element in payload.get("elements", []):
        tags = element.get("tags") or {}
        lat, lon = get_coordinates(element)

        if lat is None or lon is None:
            continue

        external_id = f"osm:{element.get('type')}:{element.get('id')}"
        if external_id in seen_external_ids:
            continue
        seen_external_ids.add(external_id)

        name = clean_name(
            tags.get("name")
            or tags.get("operator")
            or tags.get("brand")
            or f"Taller OSM {element.get('id')}"
        )
        municipality = tags.get("addr:city") or tags.get("addr:municipality")
        province = tags.get("addr:province")
        slug = unique_slug(name, municipality, external_id)
        services = infer_services(tags)

        workshops.append(
            {
                "external_id": external_id,
                "osm_type": element.get("type"),
                "osm_id": element.get("id"),
                "name": name,
                "slug": slug,
                "latitude": lat,
                "longitude": lon,
                "address_line": build_address(tags),
                "postal_code": tags.get("addr:postcode"),
                "municipality": municipality,
                "province": province,
                "phone": tags.get("phone") or tags.get("contact:phone"),
                "email": tags.get("email") or tags.get("contact:email"),
                "website": tags.get("website") or tags.get("contact:website"),
                "opening_hours": tags.get("opening_hours"),
                "services": services,
                "features": infer_features(tags),
                "source_confidence": source_confidence(tags),
                "raw_tags": tags,
            }
        )

        if limit and len(workshops) >= limit:
            break

    workshops.sort(key=lambda item: (item.get("province") or "", item["name"]))
    return workshops


def get_coordinates(element: dict[str, Any]) -> tuple[float | None, float | None]:
    if "lat" in element and "lon" in element:
        return float(element["lat"]), float(element["lon"])

    center = element.get("center") or {}
    if "lat" in center and "lon" in center:
        return float(center["lat"]), float(center["lon"])

    return None, None


def clean_name(value: str) -> str:
    return re.sub(r"\s+", " ", value).strip()


def unique_slug(name: str, municipality: str | None, external_id: str) -> str:
    digest = hashlib.sha1(external_id.encode("utf-8")).hexdigest()[:8]
    parts = [name]

    if municipality:
        parts.append(municipality)

    parts.append(digest)
    return slugify("-".join(parts))


def build_address(tags: dict[str, str]) -> str | None:
    street = tags.get("addr:street")
    number = tags.get("addr:housenumber")

    if street and number:
        return f"{street}, {number}"

    return street or tags.get("addr:full")


def infer_services(tags: dict[str, str]) -> list[str]:
    services = set()

    if tags.get("shop") == "car_repair":
        services.add("mechanical_repair")
        services.add("maintenance")

    if tags.get("shop") == "tyres":
        services.add("tyres")

    for tag, service_code in SERVICE_TAG_MAP.items():
        if tags.get(tag) in {"yes", "true", "1"}:
            services.add(service_code)

    if not services:
        services.add("mechanical_repair")

    return sorted(services)


def infer_features(tags: dict[str, str]) -> list[str]:
    features = []

    if tags.get("wheelchair") in {"yes", "limited"}:
        features.append("wheelchair_accessible")

    return features


def source_confidence(tags: dict[str, str]) -> float:
    score = 0.45

    for key in ("name", "addr:street", "phone", "contact:phone", "website", "contact:website"):
        if tags.get(key):
            score += 0.07

    return min(score, 0.85)


def write_json(workshops: list[dict[str, Any]], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps(workshops, indent=2, ensure_ascii=False) + "\n")


def write_sql(workshops: list[dict[str, Any]], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "-- Generated by scripts/import_osm_workshops.py",
        "-- Source: OpenStreetMap via Overpass API",
        "-- Attribution required: https://www.openstreetmap.org/copyright",
        "begin;",
        *osm_data_source_sql(),
        "",
    ]

    for workshop in workshops:
        lines.extend(workshop_sql(workshop))
        lines.append("")

    lines.extend(["commit;", ""])
    output_path.write_text("\n".join(lines))


def write_sql_chunks(
    workshops: list[dict[str, Any]],
    chunks_dir: Path,
    chunk_size: int,
) -> None:
    chunks_dir.mkdir(parents=True, exist_ok=True)

    for old_file in chunks_dir.glob("workshops_from_osm_spain_*.sql"):
        old_file.unlink()

    for index, start in enumerate(range(0, len(workshops), chunk_size), start=1):
        chunk = workshops[start : start + chunk_size]
        output_path = chunks_dir / f"workshops_from_osm_spain_{index:03d}.sql"
        lines = [
            "-- Generated by scripts/import_osm_workshops.py",
            "-- Source: OpenStreetMap via Overpass API",
            "-- Attribution required: https://www.openstreetmap.org/copyright",
            f"-- Chunk {index}, rows {start + 1}-{start + len(chunk)}",
            "begin;",
            *osm_data_source_sql(),
            "",
        ]

        for workshop in chunk:
            lines.extend(workshop_sql(workshop))
            lines.append("")

        lines.extend(["commit;", ""])
        output_path.write_text("\n".join(lines))


def workshop_sql(workshop: dict[str, Any]) -> list[str]:
    opening_hours = (
        json.dumps({"osm": workshop["opening_hours"]}, ensure_ascii=False)
        if workshop.get("opening_hours")
        else "{}"
    )
    raw_attributes = {
        "source": "osm",
        "osm_type": workshop["osm_type"],
        "osm_id": workshop["osm_id"],
        "tags": workshop["raw_tags"],
        "features": workshop["features"],
    }

    lines = [
        "with source as (",
        "  select id from public.data_sources where code = 'osm'",
        "), upserted_workshop as (",
        "  insert into public.workshops",
        "    (name, slug, status, country_code, province, municipality, postal_code, address_line, location, phone, email, website, opening_hours, source_confidence, data_quality_status, raw_attributes)",
        "  values",
        "    (",
        f"      {sql_quote(workshop['name'])},",
        f"      {sql_quote(workshop['slug'])},",
        "      'published',",
        "      'ES',",
        f"      {sql_quote(workshop.get('province'))},",
        f"      {sql_quote(workshop.get('municipality'))},",
        f"      {sql_quote(workshop.get('postal_code'))},",
        f"      {sql_quote(workshop.get('address_line'))},",
        f"      extensions.st_setsrid(extensions.st_makepoint({workshop['longitude']}, {workshop['latitude']}), 4326)::extensions.geography,",
        f"      {sql_quote(workshop.get('phone'))},",
        f"      {sql_quote(workshop.get('email'))},",
        f"      {sql_quote(workshop.get('website'))},",
        f"      {sql_quote(opening_hours)}::jsonb,",
        f"      {workshop['source_confidence']:.2f},",
        "      'imported',",
        f"      {sql_json(raw_attributes)}",
        "    )",
        "  on conflict (slug) do update",
        "  set",
        "    name = excluded.name,",
        "    province = excluded.province,",
        "    municipality = excluded.municipality,",
        "    postal_code = excluded.postal_code,",
        "    address_line = excluded.address_line,",
        "    location = excluded.location,",
        "    phone = coalesce(excluded.phone, public.workshops.phone),",
        "    email = coalesce(excluded.email, public.workshops.email),",
        "    website = coalesce(excluded.website, public.workshops.website),",
        "    opening_hours = excluded.opening_hours,",
        "    source_confidence = excluded.source_confidence,",
        "    data_quality_status = 'imported',",
        "    raw_attributes = excluded.raw_attributes,",
        "    updated_at = now()",
        "  returning id",
        ")",
        "insert into public.workshop_external_ids (workshop_id, source_id, external_id, raw_url, last_seen_at)",
        "select",
        "  upserted_workshop.id,",
        "  source.id,",
        f"  {sql_quote(workshop['external_id'])},",
        f"  {sql_quote(osm_url(workshop))},",
        "  now()",
        "from upserted_workshop, source",
        "on conflict (source_id, external_id) do update",
        "set workshop_id = excluded.workshop_id,",
        "    raw_url = excluded.raw_url,",
        "    last_seen_at = now();",
    ]

    for service_code in workshop["services"]:
        lines.extend(
            [
                "insert into public.workshop_services (workshop_id, service_category_id)",
                "select w.id, sc.id",
                "from public.workshops w",
                "join public.service_categories sc on sc.code = "
                + sql_quote(service_code),
                "where w.slug = " + sql_quote(workshop["slug"]),
                "on conflict (workshop_id, service_category_id) do nothing;",
            ]
        )

    for feature_code in workshop["features"]:
        lines.extend(
            [
                "insert into public.workshop_features (workshop_id, feature_code)",
                "select w.id, " + sql_quote(feature_code),
                "from public.workshops w",
                "where w.slug = " + sql_quote(workshop["slug"]),
                "on conflict (workshop_id, feature_code) do nothing;",
            ]
        )

    return lines


def osm_data_source_sql() -> list[str]:
    return [
        "insert into public.data_sources",
        "  (code, name, source_type, country_code, license_name, license_url, url)",
        "values",
        "  ('osm', 'OpenStreetMap', 'osm', 'ES', 'ODbL', 'https://www.openstreetmap.org/copyright', 'https://www.openstreetmap.org')",
        "on conflict (code) do nothing;",
    ]


def osm_url(workshop: dict[str, Any]) -> str:
    osm_type = workshop["osm_type"]
    osm_id = workshop["osm_id"]

    if osm_type == "node":
        return f"https://www.openstreetmap.org/node/{osm_id}"
    if osm_type == "way":
        return f"https://www.openstreetmap.org/way/{osm_id}"

    return f"https://www.openstreetmap.org/relation/{osm_id}"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--bbox",
        help="Optional bbox as south,west,north,east for smoke tests.",
    )
    parser.add_argument("--limit", type=int, default=None)
    parser.add_argument(
        "--from-json",
        type=Path,
        help="Build SQL outputs from an existing JSON file without querying Overpass.",
    )
    parser.add_argument(
        "--chunk-size",
        type=int,
        default=500,
        help="Number of workshops per chunk SQL file.",
    )
    parser.add_argument("--json-output", type=Path, default=JSON_OUTPUT)
    parser.add_argument("--sql-output", type=Path, default=SQL_OUTPUT)
    parser.add_argument("--chunks-dir", type=Path, default=CHUNKS_DIR)
    args = parser.parse_args()

    if args.from_json:
        workshops = json.loads(args.from_json.read_text())
        if args.limit:
            workshops = workshops[: args.limit]
    else:
        query = build_query(args.bbox)
        payload = fetch_overpass(query)
        workshops = normalize_elements(payload, args.limit)
        write_json(workshops, args.json_output)

    write_sql(workshops, args.sql_output)
    write_sql_chunks(workshops, args.chunks_dir, args.chunk_size)

    print(f"Wrote {len(workshops)} workshops")
    print(f"- {args.json_output.relative_to(ROOT)}")
    print(f"- {args.sql_output.relative_to(ROOT)}")
    print(f"- {args.chunks_dir.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
