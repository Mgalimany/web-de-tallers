#!/usr/bin/env python3
"""Build a vehicle make/model catalogue from the NHTSA vPIC API.

The script writes:
- data/vehicle-catalog.json
- supabase/seeds/vehicle_catalog_from_vpic.sql

vPIC is a strong open baseline, but it is not a perfect "Spanish market"
catalogue. We tag imported rows with market_regions=['GLOBAL','ES'] so the
product can curate local visibility later without losing the full source data.
"""

from __future__ import annotations

import argparse
import json
import re
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path
from typing import Any


API_BASE = "https://vpic.nhtsa.dot.gov/api/vehicles"
DEFAULT_VEHICLE_TYPES = ("car", "motorcycle", "truck")
ROOT = Path(__file__).resolve().parents[1]
JSON_OUTPUT = ROOT / "data" / "vehicle-catalog.json"
SQL_OUTPUT = ROOT / "supabase" / "seeds" / "vehicle_catalog_from_vpic.sql"


def slugify(value: str) -> str:
    value = value.strip().lower()
    value = re.sub(r"[^a-z0-9]+", "-", value)
    return re.sub(r"-+", "-", value).strip("-")


def sql_quote(value: str | None) -> str:
    if value is None:
        return "null"

    return "'" + value.replace("'", "''") + "'"


def fetch_json(path: str, retries: int = 3) -> dict[str, Any]:
    url = f"{API_BASE}{path}"

    for attempt in range(1, retries + 1):
        try:
            with urllib.request.urlopen(url, timeout=40) as response:
                return json.loads(response.read().decode("utf-8"))
        except (urllib.error.URLError, TimeoutError) as exc:
            if attempt == retries:
                raise RuntimeError(f"Failed to fetch {url}: {exc}") from exc
            time.sleep(1.5 * attempt)

    raise RuntimeError(f"Failed to fetch {url}")


def get_makes(vehicle_types: tuple[str, ...]) -> list[dict[str, Any]]:
    makes_by_id: dict[int, dict[str, Any]] = {}

    for vehicle_type in vehicle_types:
        encoded_type = urllib.parse.quote(vehicle_type)
        payload = fetch_json(f"/GetMakesForVehicleType/{encoded_type}?format=json")

        for row in payload.get("Results", []):
            make_id = row.get("MakeId")
            make_name = row.get("MakeName")

            if not make_id or not make_name:
                continue

            current = makes_by_id.setdefault(
                int(make_id),
                {
                    "external_id": str(make_id),
                    "name": clean_name(str(make_name)),
                    "slug": slugify(str(make_name)),
                    "vehicle_types": set(),
                },
            )
            current["vehicle_types"].add(map_vehicle_type(vehicle_type))

    makes = list(makes_by_id.values())
    makes.sort(key=lambda make: make["name"])

    for make in makes:
        make["vehicle_types"] = sorted(make["vehicle_types"])

    return makes


def get_models_for_make(make: dict[str, Any], delay_seconds: float) -> list[dict[str, Any]]:
    payload = fetch_json(f"/GetModelsForMakeId/{make['external_id']}?format=json")
    models_by_id: dict[str, dict[str, Any]] = {}

    for row in payload.get("Results", []):
        model_id = row.get("Model_ID")
        model_name = row.get("Model_Name")

        if not model_id or not model_name:
            continue

        cleaned_name = clean_name(str(model_name))
        models_by_id[str(model_id)] = {
            "external_id": str(model_id),
            "name": cleaned_name,
            "slug": slugify(cleaned_name),
            "vehicle_type": infer_model_vehicle_type(make),
        }

    time.sleep(delay_seconds)
    return sorted(models_by_id.values(), key=lambda model: model["name"])


def clean_name(value: str) -> str:
    value = value.replace("/", " / ")
    value = re.sub(r"\s+", " ", value)
    return value.strip()


def map_vehicle_type(vehicle_type: str) -> str:
    normalized = vehicle_type.lower()

    if "motor" in normalized:
        return "motorcycle"

    if "truck" in normalized:
        return "truck"

    return "car"


def infer_model_vehicle_type(make: dict[str, Any]) -> str:
    vehicle_types = make.get("vehicle_types", [])

    if "car" in vehicle_types:
        return "car"

    return vehicle_types[0] if vehicle_types else "other"


def build_catalog(
    vehicle_types: tuple[str, ...],
    limit_makes: int | None,
    delay_seconds: float,
) -> dict[str, Any]:
    makes = get_makes(vehicle_types)

    if limit_makes:
        makes = makes[:limit_makes]

    for index, make in enumerate(makes, start=1):
        print(f"[{index}/{len(makes)}] Fetching models for {make['name']}")
        make["models"] = get_models_for_make(make, delay_seconds)

    return {
        "source": "nhtsa_vpic",
        "vehicle_types": vehicle_types,
        "generated_at": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "makes": makes,
    }


def write_json(catalog: dict[str, Any], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps(catalog, indent=2, ensure_ascii=False) + "\n")


def write_sql(catalog: dict[str, Any], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "-- Generated by scripts/import_vehicle_catalog.py",
        "-- Source: NHTSA vPIC Vehicle API",
        "begin;",
        "",
    ]

    for display_order, make in enumerate(catalog["makes"], start=1):
        lines.extend(
            [
                "with upserted_make as (",
                "  insert into public.vehicle_makes",
                "    (name, slug, source_code, external_id, market_regions, display_order, active)",
                "  values",
                f"    ({sql_quote(make['name'])}, {sql_quote(make['slug'])}, 'nhtsa_vpic', {sql_quote(make['external_id'])}, array['GLOBAL','ES']::text[], {display_order}, true)",
                "  on conflict (source_code, external_id) do update",
                "  set",
                "    name = excluded.name,",
                "    slug = excluded.slug,",
                "    market_regions = excluded.market_regions,",
                "    display_order = excluded.display_order,",
                "    active = true,",
                "    updated_at = now()",
                "  returning id",
                ")",
                "insert into public.vehicle_models",
                "  (make_id, name, slug, vehicle_type, source_code, external_id, market_regions, active)",
                "values",
            ]
        )

        model_values = []
        for model in make["models"]:
            model_values.append(
                "  ("
                "(select id from upserted_make), "
                f"{sql_quote(model['name'])}, "
                f"{sql_quote(model['slug'])}, "
                f"{sql_quote(model['vehicle_type'])}, "
                "'nhtsa_vpic', "
                f"{sql_quote(model['external_id'])}, "
                "array['GLOBAL','ES']::text[], "
                "true"
                ")"
            )

        if model_values:
            lines.append(",\n".join(model_values))
            lines.extend(
                [
                    "on conflict (source_code, external_id) do update",
                    "set",
                    "  make_id = excluded.make_id,",
                    "  name = excluded.name,",
                    "  slug = excluded.slug,",
                    "  vehicle_type = excluded.vehicle_type,",
                    "  market_regions = excluded.market_regions,",
                    "  active = true,",
                    "  updated_at = now();",
                    "",
                ]
            )
        else:
            lines.extend(["select null where false;", ""])

    lines.extend(["commit;", ""])
    output_path.write_text("\n".join(lines))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--vehicle-types",
        default=",".join(DEFAULT_VEHICLE_TYPES),
        help="Comma-separated vPIC vehicle type queries.",
    )
    parser.add_argument(
        "--limit-makes",
        type=int,
        default=None,
        help="Limit number of makes for a quick smoke test.",
    )
    parser.add_argument(
        "--delay",
        type=float,
        default=0.12,
        help="Delay between model requests to be polite with the public API.",
    )
    args = parser.parse_args()

    vehicle_types = tuple(
        vehicle_type.strip()
        for vehicle_type in args.vehicle_types.split(",")
        if vehicle_type.strip()
    )

    catalog = build_catalog(vehicle_types, args.limit_makes, args.delay)
    write_json(catalog, JSON_OUTPUT)
    write_sql(catalog, SQL_OUTPUT)

    makes_count = len(catalog["makes"])
    models_count = sum(len(make["models"]) for make in catalog["makes"])
    print(f"Wrote {makes_count} makes and {models_count} models")
    print(f"- {JSON_OUTPUT.relative_to(ROOT)}")
    print(f"- {SQL_OUTPUT.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
