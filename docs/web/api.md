# FastAPI

La carpeta `api/` conte una primera capa backend per no haver de posar tota la logica al client.

## Endpoints

- `GET /health`: comprovacio basica.
- `POST /workshops/search`: proxy cap a la RPC `search_workshops` de Supabase.

## Variables

```bash
SUPABASE_URL=
SUPABASE_SERVICE_ROLE_KEY=
```

En desenvolupament tambe pot llegir:

```bash
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

Per produccio, millor usar `SUPABASE_SERVICE_ROLE_KEY` nomes al servidor.

## Execucio Local

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn api.main:app --reload --port 8000
```

## Seguent Iteracio

- Afegir geocodificacio d'ubicacions.
- Afegir autenticacio server-side.
- Afegir endpoint de tallers per bounding box.
- Afegir importadors OSM i datasets oficials.
- Afegir test d'integracio contra Supabase dev.
