-- Populate workshop review stats with simulated Google-derived data
-- Scale: Google 1-5 -> Web 2-10 (Score = Stars * 2)

BEGIN;

-- 1. Clear existing stats
DELETE FROM public.workshop_review_stats;

-- 2. Insert simulated data for all published workshops
INSERT INTO public.workshop_review_stats (
  workshop_id,
  review_count,
  verified_review_count,
  avg_overall_score,
  avg_service,
  avg_treatment,
  avg_knowledge,
  avg_price_value,
  avg_would_return
)
SELECT
  id as workshop_id,
  floor(random() * 345 + 5)::int as review_count, -- 5 to 350 reviews
  floor(random() * 15)::int as verified_review_count,
  (random() * 2.8 + 7.0)::numeric(4,2) as avg_overall_score, -- 7.0 to 9.8 score (3.5 to 4.9 stars)
  (random() * 3 + 7)::numeric(4,2) as avg_service,
  (random() * 3 + 7)::numeric(4,2) as avg_treatment,
  (random() * 3 + 7)::numeric(4,2) as avg_knowledge,
  (random() * 3 + 7)::numeric(4,2) as avg_price_value,
  (random() * 2 + 8)::numeric(4,2) as avg_would_return
FROM public.workshops
WHERE status = 'published';

-- 3. Calculate Bayesian score
-- Bayesian Average = (v*R + m*C) / (v+m)
-- v = review_count
-- m = threshold (e.g., 25 reviews)
-- R = avg_overall_score
-- C = global mean
WITH global_stats AS (
  SELECT 
    avg(avg_overall_score) as mean_score,
    25 as threshold
  FROM public.workshop_review_stats
)
UPDATE public.workshop_review_stats
SET bayesian_score = (
  (review_count * avg_overall_score + threshold * mean_score) / (review_count + threshold)
)
FROM global_stats;

COMMIT;
