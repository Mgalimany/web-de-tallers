-- Create workshop images table and seed placeholder data
BEGIN;

CREATE TABLE IF NOT EXISTS public.workshop_images (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  workshop_id uuid NOT NULL REFERENCES public.workshops(id) ON DELETE CASCADE,
  url text NOT NULL,
  alt_text text,
  is_primary boolean NOT NULL DEFAULT false,
  display_order integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS workshop_images_workshop_id_idx ON public.workshop_images(workshop_id);

-- Enable RLS
ALTER TABLE public.workshop_images ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Workshop images are public" ON public.workshop_images
  FOR SELECT USING (true);

-- Seed placeholders for some workshops
-- Using high-quality Unsplash car/workshop related images
WITH sample_images AS (
  SELECT unnest(ARRAY[
    'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?auto=format&fit=crop&q=80&w=1200',
    'https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&q=80&w=1200',
    'https://images.unsplash.com/photo-1530046339160-ce3e5b0c7a2f?auto=format&fit=crop&q=80&w=1200',
    'https://images.unsplash.com/photo-1517524206127-48bbd363f3d7?auto=format&fit=crop&q=80&w=1200',
    'https://images.unsplash.com/photo-1504222490345-c075b6008014?auto=format&fit=crop&q=80&w=1200',
    'https://images.unsplash.com/photo-1625047509168-a7026f36ae04?auto=format&fit=crop&q=80&w=1200',
    'https://images.unsplash.com/photo-1580273916550-e323be2ae537?auto=format&fit=crop&q=80&w=1200'
  ]) as url
),
target_workshops AS (
  SELECT id FROM public.workshops WHERE status = 'published' LIMIT 500
)
INSERT INTO public.workshop_images (workshop_id, url, is_primary, display_order)
SELECT 
  tw.id,
  si.url,
  (row_number() OVER (PARTITION BY tw.id ORDER BY random()) = 1) as is_primary,
  (row_number() OVER (PARTITION BY tw.id ORDER BY random()))::int as display_order
FROM target_workshops tw
CROSS JOIN sample_images si
WHERE random() > 0.4; -- Assign 3-4 images to each of the 500 workshops

COMMIT;
