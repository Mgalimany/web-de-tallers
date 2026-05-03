# Database Model

## Objectiu

La base de dades esta pensada per una web de tallers a nivell d'Espanya, amb:

- tallers geolocalitzats amb PostGIS,
- reviews amb puntuacions de 0 a 10,
- vehicles d'usuaris per marca i model,
- especialitzacio de tallers per marca,
- serveis i filtres comercials,
- fonts de dades importades i deduplicables,
- RLS preparada per Supabase Auth.

## Decisions Principals

Supabase fa servir Postgres, no MySQL. Per aquest producte aixo es un avantatge clar: PostGIS resol la part mes important del negoci, que es trobar tallers propers i ordenar-los per distancia, encaix amb el vehicle i reputacio.

Les coordenades es guarden a `workshops.location` com a `geography(Point, 4326)`. Aixo permet fer cerques en metres amb `ST_DWithin` i `ST_Distance`, sense haver de calcular distancies manualment a l'API.

## Taules Core

- `profiles`: perfil public intern associat a `auth.users`.
- `vehicle_makes` i `vehicle_models`: cataleg de marques i models.
- `user_vehicles`: vehicles guardats pels clients.
- `workshops`: fitxa principal del taller.
- `workshop_services`: serveis que ofereix cada taller.
- `workshop_features`: filtres comercials com cotxe de substitucio, recollida, grua o cita online.
- `workshop_brand_specializations`: marques acceptades, frequents, especialistes o oficials.
- `reviews`: reviews 0-10 per servei, tracte, coneixement, preu/valor i si tornaria.
- `workshop_review_stats`: agregats de reviews i score bayesia per ranking.
- `data_sources`, `raw_workshop_imports` i `workshop_external_ids`: capa d'importacio, atribucio i deduplicacio.
- `workshop_claims`: reclamacio de fitxes per part dels tallers.

## Cerca I Ranking

La migracio crea dues funcions RPC:

- `search_workshops(...)`: cerca per lat/lng, radi, marca, servei, preu/hora maxim i rating minim.
- `workshops_in_view(...)`: retorna punts per pintar el mapa dins d'una bounding box.

El ranking inicial prioritza:

1. encaix amb la marca del vehicle,
2. score bayesia,
3. reviews verificades,
4. distancia.

El score bayesia evita que un taller amb una sola review de 10 aparegui per sobre d'un taller amb moltes reviews bones.

## Estrategia De Dades Per Espanya

No convé dependre d'una sola font. La base contempla diverses fonts:

- OpenStreetMap per cobertura nacional base.
- DGT Libro Taller per tallers adherits.
- datos.gob.es i registres autonomics quan existeixin datasets oberts.
- dades introduides o reclamades pels propietaris dels tallers.

Cada registre importat pot conservar el payload original a `raw_workshop_imports`. Despres es normalitza i s'uneix a `workshops`. La deduplicacio s'hauria de fer amb una combinacio de:

- nom normalitzat,
- telefon,
- web/email,
- adreca,
- distancia GPS,
- identificadors externs.

## RLS I Seguretat

La migracio activa Row Level Security a totes les taules principals.

Els usuaris poden:

- veure tallers publicats,
- gestionar els seus vehicles,
- crear i editar reviews propies no verificades,
- reclamar tallers,
- reportar reviews.

Els propietaris de taller poden editar fitxes reclamades, serveis, marques i caracteristiques.

Les accions sensibles, com verificar tallers, aprovar claims, tocar imports bruts o marcar reviews com verificades, queden reservades a `admin`, `moderator` o al `service_role`.

## Properes Migracions Recomanades

- Taules de `bookings` i `quote_requests`.
- Factures o comprovants per marcar `verified_visit`.
- Agenda i disponibilitat dels tallers.
- Normalitzacio d'horaris d'obertura en comptes de nomes `jsonb`.
- Auditing de canvis en fitxes reclamades.
- Taules SEO per provincia, municipi, marca i servei.
- Funcio de deduplicacio assistida amb scoring.
