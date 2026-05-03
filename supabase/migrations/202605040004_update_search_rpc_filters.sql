create or replace function public.search_workshops(
  p_lat double precision,
  p_lng double precision,
  p_radius_m integer default 25000,
  p_make_id bigint default null,
  p_service_code text default null,
  p_max_hourly_rate_eur numeric default null,
  p_min_bayesian_score numeric default null,
  p_only_verified boolean default false,
  p_only_dgt_libro_taller boolean default false,
  p_limit integer default 50,
  p_offset integer default 0
)
returns table (
  id uuid,
  name text,
  slug text,
  address_line text,
  municipality text,
  province text,
  latitude double precision,
  longitude double precision,
  distance_m double precision,
  hourly_rate_eur numeric,
  verified boolean,
  dgt_libro_taller boolean,
  review_count integer,
  avg_overall_score numeric,
  bayesian_score numeric,
  brand_match boolean
)
language sql
stable
as $$
  with query_point as (
    select extensions.st_setsrid(extensions.st_makepoint(p_lng, p_lat), 4326)::extensions.geography as location
  )
  select
    w.id,
    w.name,
    w.slug,
    w.address_line,
    w.municipality,
    w.province,
    extensions.st_y(w.location::extensions.geometry) as latitude,
    extensions.st_x(w.location::extensions.geometry) as longitude,
    extensions.st_distance(w.location, qp.location) as distance_m,
    w.hourly_rate_eur,
    w.verified,
    w.dgt_libro_taller,
    coalesce(s.review_count, 0) as review_count,
    s.avg_overall_score,
    s.bayesian_score,
    exists (
      select 1
      from public.workshop_brand_specializations wbs
      where wbs.workshop_id = w.id
        and wbs.make_id = p_make_id
    ) as brand_match
  from public.workshops w
  cross join query_point qp
  left join public.workshop_review_stats s on s.workshop_id = w.id
  where w.status = 'published'
    and extensions.st_dwithin(
      w.location,
      qp.location,
      least(greatest(coalesce(p_radius_m, 25000), 100), 200000)
    )
    and (
      p_make_id is null
      or exists (
        select 1
        from public.workshop_brand_specializations wbs
        where wbs.workshop_id = w.id
          and wbs.make_id = p_make_id
      )
    )
    and (
      p_service_code is null
      or exists (
        select 1
        from public.workshop_services ws
        join public.service_categories sc on sc.id = ws.service_category_id
        where ws.workshop_id = w.id
          and sc.code = p_service_code
      )
    )
    and (p_max_hourly_rate_eur is null or w.hourly_rate_eur <= p_max_hourly_rate_eur)
    and (p_min_bayesian_score is null or s.bayesian_score >= p_min_bayesian_score)
    and (p_only_verified is false or w.verified = true)
    and (p_only_dgt_libro_taller is false or w.dgt_libro_taller = true)
  order by
    exists (
      select 1
      from public.workshop_brand_specializations wbs
      where wbs.workshop_id = w.id
        and wbs.make_id = p_make_id
    ) desc,
    coalesce(s.bayesian_score, 0) desc,
    coalesce(s.verified_review_count, 0) desc,
    extensions.st_distance(w.location, qp.location) asc
  limit greatest(coalesce(p_limit, 50), 1)
  offset greatest(coalesce(p_offset, 0), 0);
$$;
