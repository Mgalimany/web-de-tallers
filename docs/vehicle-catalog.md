# Vehicle Catalogue

## Decisio

Per tenir marques i models del mercat europeu/espanyol, la millor via no sembla una API publica oficial unica. Les fonts oficials europees estan mes orientades a homologacio, VIN i type approval que no pas a un cataleg comercial net de marques/models.

Per tant, l'estrategia recomanada es:

1. **Font europea comercial en JSON/API** per carregar el cataleg complet.
2. **BBDD propia a Supabase** per tenir control, performance i curacio.
3. **NHTSA vPIC** nomes com a fallback o complement obert, no com a font principal europea.

## Fonts Europees Avaluades

### Auto-Data.net API

API comercial amb dades europees fortes:

- mes de 350 marques,
- mes de 3.500 models,
- mes de 10.000 generacions,
- mes de 55.000 especificacions,
- XML/JSON.

Web: `https://api.auto-data.net/`

La veig com la millor candidata si volem una API viva i dades tecniques completes.

### AutoDB

Pack comercial descarregable en JSON/CSV:

- 237 marques,
- 4.142 models,
- categories cotxe, moto, camper i utilitaris,
- llicencia comercial,
- pagament unic.

Web: `https://autodb.store/en/`

La veig molt bona si volem importar-ho tot a Supabase i no dependre d'una API cada vegada.

### AutoRef.eu

API europea de VIN i type approval:

- VIN lookup,
- EU type approval lookup,
- dades com marca, model, variant, versio, motor i combustible.

Web: `https://autoref.eu/en/api-overview`

Es mes bona per enriquir vehicles concrets que per generar un cataleg comercial complet.

### Bases Oficials UE

La Comissio Europea publica informacio sobre type approvals, pero no he vist una API oberta simple per extreure "totes les marques i models comercials" en format producte.

Referencies:

- `https://commission.europa.eu/publications/type-approvals-automotive-vehicles_en`
- `https://single-market-economy.ec.europa.eu/sectors/automotive-industry/technical-harmonisation/faq-type-approval-vehicles_en`

## Estructura Supabase

La migracio `202605030001_vehicle_catalog_enrichment.sql` afegeix:

- `source_code`,
- `external_id`,
- `market_regions`,
- `display_order`,
- anys `year_from` / `year_to`,
- taules d'alies per marques i models.

Aixo permet importar dades d'AutoDB, Auto-Data, AutoRef o qualsevol altre proveidor sense canviar el frontend.

## Importar JSON Europeu

Quan tinguem un JSON comercial o export del proveidor:

```bash
python3 scripts/import_vehicle_catalog_json.py ruta/al/cataleg.json
```

Sortida:

```bash
supabase/seeds/vehicle_catalog_from_vendor.sql
```

Aquest SQL es pot enganxar al Supabase SQL Editor.

Formats acceptats:

```json
{
  "brands": [
    {
      "name": "BMW",
      "country": "Germany",
      "models": [
        { "name": "3 Series", "type": "Sedan", "years": "1975-present" }
      ]
    }
  ]
}
```

o:

```json
[
  { "make": "BMW", "models": ["1 Series", "3 Series"] }
]
```

## Importador Obert De Backup

També existeix:

```bash
python3 scripts/import_vehicle_catalog.py
```

Aquest fa servir NHTSA vPIC. Serveix per tenir una base oberta, pero no l'agafaria com a font principal europea.

## Frontend

La web ja llegeix marques des de `vehicle_makes` i models des de `vehicle_models`.

Si Supabase encara no te dades, fa fallback al mock local de marques principals.

## Recomanacio

Per aquest projecte, jo faria:

1. Comprar o contractar una font europea tipus **AutoDB** o **Auto-Data.net**.
2. Importar tot a Supabase.
3. Curar `active` i `display_order` per prioritzar marques habituals a Espanya.
4. Usar AutoRef o similar mes endavant per VIN/type approval quan l'usuari vulgui identificar exactament el seu vehicle.
