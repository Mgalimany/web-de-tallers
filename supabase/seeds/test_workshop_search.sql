-- Smoke tests after importing OSM workshops.

select count(*) as osm_workshops
from public.workshops
where raw_attributes->>'source' = 'osm';

select
  id,
  name,
  municipality,
  province,
  distance_m,
  bayesian_score,
  review_count
from public.search_workshops(
  41.3874,
  2.1686,
  25000,
  null,
  null,
  null,
  null,
  20,
  0
);
