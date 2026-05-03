# Web de Tallers

Directori i marketplace de tallers de vehicles per Espanya.

La primera decisio tecnica queda fixada: la base de dades sera Supabase Postgres amb PostGIS. Aixo ens dona cerques per proximitat, filtres per marca/model, puntuacions 0-10 i una base preparada per importar tallers de fonts oficials, OpenStreetMap i dades reclamades pels propis tallers.

## Stack previst

- Frontend: Next.js + React.
- API: FastAPI.
- Base de dades: Supabase Postgres + PostGIS.
- Auth: Supabase Auth amb Google com a primer proveidor.
- Mapes: MapLibre/OpenStreetMap com a opcio base; Google Maps/Places nomes si el cost i les restriccions de dades encaixen.

## Estat actual

- `supabase/migrations/202605020001_initial_postgis_schema.sql`: migracio inicial de BBDD.
- `docs/database.md`: explicacio del model, RLS, cerca geoespacial i importacio de dades.
- `app/`, `components/` i `lib/`: primera pantalla Next.js del cercador de tallers.
- `docs/web/frontend.md`: notes per connectar el frontend amb Supabase.
- `api/`: primera API FastAPI per cercar tallers via Supabase RPC.
- `docs/web/api.md`: notes de configuracio del backend.
- `scripts/import_vehicle_catalog.py`: importador de marques i models via NHTSA vPIC.
- `scripts/import_osm_workshops.py`: importador de tallers d'Espanya via OpenStreetMap/Overpass.
- `docs/vehicle-catalog.md`: estrategia del cataleg de vehicles.
- `docs/workshop-import.md`: estrategia d'importacio de tallers.

## Desenvolupament web

Variables necessaries:

```bash
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

Comandes previstes:

```bash
npm install
npm run dev
```

La web funciona amb dades mock si no hi ha variables de Supabase configurades. El mapa principal fa servir OpenStreetMap amb MapLibre, sense API key.

API local:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn api.main:app --reload --port 8000
```

## Seguents passos

1. Crear el projecte Supabase i executar la migracio.
2. Instal·lar dependencies i arrencar Next.js.
3. Connectar les variables de Supabase a Antigravity.
4. Fer el primer import nacional amb OpenStreetMap i fonts oficials disponibles.
5. Afegir geocodificacio de ciutat/codi postal i importacio de tallers reals.
6. Afegir perfil de taller, reviews 0-10 i vehicles de l'usuari.
