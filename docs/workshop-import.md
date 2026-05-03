# Workshop Import

## Font Inicial

La font oberta inicial per tallers d'Espanya es **OpenStreetMap** via Overpass.

Tags principals:

- `shop=car_repair`
- `shop=tyres`
- `service:vehicle:car_repair=yes`

OSM documenta `shop=car_repair` com negocis on es reparen vehicles, amb tags útils com `name`, `addr:*`, `website`, `phone`, `opening_hours`, `brand` i `service:vehicle:*`.

Cal atribucio OSM:

`https://www.openstreetmap.org/copyright`

## Smoke Test

Per generar un seed petit de Barcelona:

```bash
python3 scripts/import_osm_workshops.py --bbox 41.30,2.05,41.48,2.25 --limit 25
```

Sortides:

- `data/workshops-osm-spain.json`
- `supabase/seeds/workshops_from_osm_spain.sql`
- `supabase/seeds/workshops_osm_chunks/*.sql`

## Import Espanya

Per generar el seed nacional:

```bash
python3 scripts/import_osm_workshops.py
```

Pot trigar uns minuts i depen de la disponibilitat d'Overpass.

## Aplicar A Supabase

Com que el client public de Supabase no pot inserir massivament en taules protegides per RLS, aplica el SQL generat des del **Supabase SQL Editor** o des d'Antigravity amb privilegis de projecte:

```sql
-- enganxar contingut de:
-- supabase/seeds/workshops_osm_chunks/workshops_from_osm_spain_001.sql
```

Recomanat: executar els chunks en ordre, del `001` al `017`. Cada chunk porta `begin; ... commit;`.

Despres prova:

```sql
-- supabase/seeds/test_workshop_search.sql
```

## Notes De Qualitat

OSM no es perfecte: alguns tallers no tenen telefon, web o provincia. Per això guardem `raw_attributes`, `source_confidence` i `workshop_external_ids`.

La seguent fase hauria de combinar:

- OSM nacional,
- DGT Libro Taller,
- datasets autonomics oberts,
- reclamacio de fitxa pels propis tallers.
