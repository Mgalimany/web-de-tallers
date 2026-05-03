# Frontend

## Objectiu De La Primera Pantalla

La primera versio web mostra:

- cercador de tallers per ubicacio,
- filtres per marca, servei, radi, preu/hora i puntuacio minima,
- mapa visual amb pins,
- llistat de tallers ordenat per encaix,
- panell de vehicle de l'usuari,
- dades mock quan Supabase encara no esta configurat.

El component principal es `components/workshop-search.tsx`.

## Connexio Amb Supabase

Crear un fitxer `.env.local` amb:

```bash
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

El client esta a `lib/supabase.ts`.

La cerca real es fa des de `lib/workshops.ts` amb la RPC:

```ts
supabase.rpc("search_workshops", {
  p_lat: 41.3874,
  p_lng: 2.1686,
  p_radius_m: 25000,
  p_make_id: 2,
  p_service_code: "diagnostics",
  p_max_hourly_rate_eur: 70,
  p_min_bayesian_score: 7.5,
  p_limit: 50,
  p_offset: 0
});
```

El mapa fa servir OpenStreetMap amb MapLibre. No cal API key i podem controlar markers, zoom, bounds i interaccions des del frontend.

El boto "La meva posicio" fa servir `navigator.geolocation`, actualitza les coordenades de cerca i torna a cridar `search_workshops`.

Ara mateix la geocodificacio esta simplificada i envia Barcelona com a punt per defecte quan l'usuari no activa la seva posicio. La seguent iteracio hauria d'afegir:

- geocodificacio de ciutat/codi postal,
- ubicacio real del navegador,
- bounding box real del mapa,
- importacio de tallers reals a Supabase.

## Instal·lacio

Quan vulguem executar-ho localment:

```bash
npm install
npm run dev
```

No he instal·lat dependencies en aquest entorn perquè el projecte treballara amb Antigravity i Supabase web.
