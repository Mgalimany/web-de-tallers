-- Seed vehicle makes and models
BEGIN;

-- Seat
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Seat', 'seat', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Alhambra', 'alhambra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Altea', 'altea', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Altea XL', 'altea-xl', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Arosa', 'arosa', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Cordoba', 'cordoba', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Cordoba Vario', 'cordoba-vario', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Exeo', 'exeo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Ibiza', 'ibiza', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Ibiza ST', 'ibiza-st', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Exeo ST', 'exeo-st', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Leon', 'leon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Leon ST', 'leon-st', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Inca', 'inca', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Mii', 'mii', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'seat'), 'Toledo', 'toledo', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Renault
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Renault', 'renault', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Captur', 'captur', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Clio', 'clio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Clio Grandtour', 'clio-grandtour', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Espace', 'espace', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Express', 'express', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Fluence', 'fluence', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Grand Espace', 'grand-espace', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Grand Modus', 'grand-modus', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Grand Scenic', 'grand-scenic', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Kadjar', 'kadjar', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Kangoo', 'kangoo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Kangoo Express', 'kangoo-express', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Koleos', 'koleos', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Laguna', 'laguna', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Laguna Grandtour', 'laguna-grandtour', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Latitude', 'latitude', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Mascott', 'mascott', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Mégane', 'mgane', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Mégane CC', 'mgane-cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Mégane Combi', 'mgane-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Mégane Grandtour', 'mgane-grandtour', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Mégane Coupé', 'mgane-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Mégane Scénic', 'mgane-scnic', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Scénic', 'scnic', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Talisman', 'talisman', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Talisman Grandtour', 'talisman-grandtour', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Thalia', 'thalia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Twingo', 'twingo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Wind', 'wind', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'renault'), 'Zoé', 'zo', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Peugeot
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Peugeot', 'peugeot', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '1007', '1007', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '107', '107', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '106', '106', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '108', '108', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '2008', '2008', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '205', '205', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '205 Cabrio', '205-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '206', '206', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '206 CC', '206-cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '206 SW', '206-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '207', '207', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '207 CC', '207-cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '207 SW', '207-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '306', '306', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '307', '307', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '307 CC', '307-cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '307 SW', '307-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '308', '308', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '308 CC', '308-cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '308 SW', '308-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '309', '309', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '4007', '4007', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '4008', '4008', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '405', '405', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '406', '406', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '407', '407', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '407 SW', '407-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '5008', '5008', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '508', '508', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '508 SW', '508-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '605', '605', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '806', '806', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '607', '607', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), '807', '807', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), 'Bipper', 'bipper', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'peugeot'), 'RCZ', 'rcz', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Dacia
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Dacia', 'dacia', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'dacia'), 'Dokker', 'dokker', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dacia'), 'Duster', 'duster', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dacia'), 'Lodgy', 'lodgy', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dacia'), 'Logan', 'logan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dacia'), 'Logan MCV', 'logan-mcv', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dacia'), 'Logan Van', 'logan-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dacia'), 'Sandero', 'sandero', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dacia'), 'Solenza', 'solenza', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Citroën
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Citroën', 'citron', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'Berlingo', 'berlingo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C-Crosser', 'c-crosser', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C-Elissée', 'c-elisse', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C-Zero', 'c-zero', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C1', 'c1', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C2', 'c2', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C3', 'c3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C3 Picasso', 'c3-picasso', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C4', 'c4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C4 Aircross', 'c4-aircross', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C4 Cactus', 'c4-cactus', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C4 Coupé', 'c4-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C4 Grand Picasso', 'c4-grand-picasso', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C4 Sedan', 'c4-sedan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C5', 'c5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C5 Break', 'c5-break', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C5 Tourer', 'c5-tourer', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C6', 'c6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'C8', 'c8', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'DS3', 'ds3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'DS4', 'ds4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'DS5', 'ds5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'Evasion', 'evasion', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'Jumper', 'jumper', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'Jumpy', 'jumpy', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'Saxo', 'saxo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'Nemo', 'nemo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'Xantia', 'xantia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'citron'), 'Xsara', 'xsara', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Opel
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Opel', 'opel', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Agila', 'agila', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Ampera', 'ampera', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Antara', 'antara', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Astra', 'astra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Astra cabrio', 'astra-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Astra caravan', 'astra-caravan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Astra coupé', 'astra-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Calibra', 'calibra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Campo', 'campo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Cascada', 'cascada', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Corsa', 'corsa', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Frontera', 'frontera', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Insignia', 'insignia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Insignia kombi', 'insignia-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Kadett', 'kadett', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Meriva', 'meriva', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Mokka', 'mokka', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Movano', 'movano', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Omega', 'omega', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Signum', 'signum', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Vectra', 'vectra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Vectra Caravan', 'vectra-caravan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Vivaro', 'vivaro', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Vivaro Kombi', 'vivaro-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'opel'), 'Zafira', 'zafira', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Alfa Romeo
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Alfa Romeo', 'alfa-romeo', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '145', '145', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '146', '146', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '147', '147', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '155', '155', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '156', '156', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '156 Sportwagon', '156-sportwagon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '159', '159', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '159 Sportwagon', '159-sportwagon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '164', '164', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '166', '166', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), '4C', '4c', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), 'Brera', 'brera', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), 'GTV', 'gtv', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), 'MiTo', 'mito', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), 'Crosswagon', 'crosswagon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), 'Spider', 'spider', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), 'GT', 'gt', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), 'Giulietta', 'giulietta', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'alfa-romeo'), 'Giulia', 'giulia', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Škoda
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Škoda', 'koda', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Favorit', 'favorit', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Felicia', 'felicia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Citigo', 'citigo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Fabia', 'fabia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Fabia Combi', 'fabia-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Fabia Sedan', 'fabia-sedan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Felicia Combi', 'felicia-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Octavia', 'octavia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Octavia Combi', 'octavia-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Roomster', 'roomster', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Yeti', 'yeti', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Rapid', 'rapid', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Rapid Spaceback', 'rapid-spaceback', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Superb', 'superb', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'koda'), 'Superb Combi', 'superb-combi', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Chevrolet
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Chevrolet', 'chevrolet', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Alero', 'alero', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Aveo', 'aveo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Camaro', 'camaro', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Captiva', 'captiva', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Corvette', 'corvette', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Cruze', 'cruze', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Cruze SW', 'cruze-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Epica', 'epica', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Equinox', 'equinox', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Evanda', 'evanda', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'HHR', 'hhr', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Kalos', 'kalos', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Lacetti', 'lacetti', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Lacetti SW', 'lacetti-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Lumina', 'lumina', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Malibu', 'malibu', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Matiz', 'matiz', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Monte Carlo', 'monte-carlo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Nubira', 'nubira', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Orlando', 'orlando', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Spark', 'spark', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Suburban', 'suburban', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Tacuma', 'tacuma', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Tahoe', 'tahoe', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chevrolet'), 'Trax', 'trax', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Porsche
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Porsche', 'porsche', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), '911 Carrera', '911-carrera', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), '911 Carrera Cabrio', '911-carrera-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), '911 Targa', '911-targa', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), '911 Turbo', '911-turbo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), '924', '924', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), '944', '944', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), '997', '997', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), 'Boxster', 'boxster', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), 'Cayenne', 'cayenne', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), 'Cayman', 'cayman', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), 'Macan', 'macan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'porsche'), 'Panamera', 'panamera', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Honda
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Honda', 'honda', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Accord', 'accord', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Accord Coupé', 'accord-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Accord Tourer', 'accord-tourer', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'City', 'city', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Civic', 'civic', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Civic Aerodeck', 'civic-aerodeck', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Civic Coupé', 'civic-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Civic Tourer', 'civic-tourer', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Civic Type R', 'civic-type-r', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'CR-V', 'cr-v', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'CR-X', 'cr-x', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'CR-Z', 'cr-z', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'FR-V', 'fr-v', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'HR-V', 'hr-v', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Insight', 'insight', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Integra', 'integra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Jazz', 'jazz', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Legend', 'legend', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'honda'), 'Prelude', 'prelude', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Subaru
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Subaru', 'subaru', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'BRZ', 'brz', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Forester', 'forester', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Impreza', 'impreza', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Impreza Wagon', 'impreza-wagon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Justy', 'justy', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Legacy', 'legacy', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Legacy Wagon', 'legacy-wagon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Legacy Outback', 'legacy-outback', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Levorg', 'levorg', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Outback', 'outback', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'SVX', 'svx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Tribeca', 'tribeca', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'Tribeca B9', 'tribeca-b9', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'subaru'), 'XV', 'xv', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Mazda
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Mazda', 'mazda', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '121', '121', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '2', '2', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '3', '3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '323', '323', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '323 Combi', '323-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '323 Coupé', '323-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '323 F', '323-f', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '5', '5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '6', '6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '6 Combi', '6-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '626', '626', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), '626 Combi', '626-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'B-Fighter', 'b-fighter', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'B2500', 'b2500', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'BT', 'bt', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'CX-3', 'cx-3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'CX-5', 'cx-5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'CX-7', 'cx-7', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'CX-9', 'cx-9', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'Demio', 'demio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'MPV', 'mpv', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'MX-3', 'mx-3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'MX-5', 'mx-5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'MX-6', 'mx-6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'Premacy', 'premacy', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'RX-7', 'rx-7', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'RX-8', 'rx-8', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mazda'), 'Xedox 6', 'xedox-6', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Mitsubishi
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Mitsubishi', 'mitsubishi', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), '3000 GT', '3000-gt', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'ASX', 'asx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Carisma', 'carisma', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Colt', 'colt', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Colt CC', 'colt-cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Eclipse', 'eclipse', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Fuso canter', 'fuso-canter', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Galant', 'galant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Galant Combi', 'galant-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Grandis', 'grandis', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'L200', 'l200', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'L200 Pick up', 'l200-pick-up', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'L200 Pick up Allrad', 'l200-pick-up-allrad', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'L300', 'l300', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Lancer', 'lancer', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Lancer Combi', 'lancer-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Lancer Evo', 'lancer-evo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Lancer Sportback', 'lancer-sportback', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Outlander', 'outlander', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Pajero', 'pajero', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Pajeto Pinin', 'pajeto-pinin', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Pajero Pinin Wagon', 'pajero-pinin-wagon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Pajero Sport', 'pajero-sport', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Pajero Wagon', 'pajero-wagon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mitsubishi'), 'Space Star', 'space-star', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Lexus
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Lexus', 'lexus', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'CT', 'ct', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'GS', 'gs', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'GS 300', 'gs-300', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'GX', 'gx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'IS', 'is', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'IS 200', 'is-200', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'IS 250 C', 'is-250-c', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'IS-F', 'is-f', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'LS', 'ls', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'LX', 'lx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'NX', 'nx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'RC F', 'rc-f', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'RX', 'rx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'RX 300', 'rx-300', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'RX 400h', 'rx-400h', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'RX 450h', 'rx-450h', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'lexus'), 'SC 430', 'sc-430', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Toyota
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Toyota', 'toyota', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), '4-Runner', '4-runner', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Auris', 'auris', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Avensis', 'avensis', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Avensis Combi', 'avensis-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Avensis Van Verso', 'avensis-van-verso', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Aygo', 'aygo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Camry', 'camry', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Carina', 'carina', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Celica', 'celica', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Corolla', 'corolla', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Corolla Combi', 'corolla-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Corolla sedan', 'corolla-sedan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Corolla Verso', 'corolla-verso', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'FJ Cruiser', 'fj-cruiser', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'GT86', 'gt86', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Hiace', 'hiace', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Hiace Van', 'hiace-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Highlander', 'highlander', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Hilux', 'hilux', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Land Cruiser', 'land-cruiser', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'MR2', 'mr2', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Paseo', 'paseo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Picnic', 'picnic', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Prius', 'prius', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'RAV4', 'rav4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Sequoia', 'sequoia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Starlet', 'starlet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Supra', 'supra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Tundra', 'tundra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Urban Cruiser', 'urban-cruiser', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Verso', 'verso', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Yaris', 'yaris', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'toyota'), 'Yaris Verso', 'yaris-verso', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- BMW
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('BMW', 'bmw', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'i3', 'i3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'i8', 'i8', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'M3', 'm3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'M4', 'm4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'M5', 'm5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'M6', 'm6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 1', 'rad-1', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 1 Cabrio', 'rad-1-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 1 Coupé', 'rad-1-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 2', 'rad-2', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 2 Active Tourer', 'rad-2-active-tourer', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 2 Coupé', 'rad-2-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 2 Gran Tourer', 'rad-2-gran-tourer', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 3', 'rad-3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 3 Cabrio', 'rad-3-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 3 Compact', 'rad-3-compact', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 3 Coupé', 'rad-3-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 3 GT', 'rad-3-gt', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 3 Touring', 'rad-3-touring', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 4', 'rad-4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 4 Cabrio', 'rad-4-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 4 Gran Coupé', 'rad-4-gran-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 5', 'rad-5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 5 GT', 'rad-5-gt', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 5 Touring', 'rad-5-touring', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 6', 'rad-6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 6 Cabrio', 'rad-6-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 6 Coupé', 'rad-6-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 6 Gran Coupé', 'rad-6-gran-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 7', 'rad-7', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Rad 8 Coupé', 'rad-8-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'X1', 'x1', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'X3', 'x3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'X4', 'x4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'X5', 'x5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'X6', 'x6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Z3', 'z3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Z3 Coupé', 'z3-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Z3 Roadster', 'z3-roadster', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Z4', 'z4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'bmw'), 'Z4 Roadster', 'z4-roadster', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Volkswagen
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Volkswagen', 'volkswagen', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Amarok', 'amarok', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Beetle', 'beetle', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Bora', 'bora', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Bora Variant', 'bora-variant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Caddy', 'caddy', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Caddy Van', 'caddy-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Life', 'life', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'California', 'california', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Caravelle', 'caravelle', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'CC', 'cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Crafter', 'crafter', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Crafter Van', 'crafter-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Crafter Kombi', 'crafter-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'CrossTouran', 'crosstouran', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Eos', 'eos', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Fox', 'fox', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Golf', 'golf', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Golf Cabrio', 'golf-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Golf Plus', 'golf-plus', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Golf Sportvan', 'golf-sportvan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Golf Variant', 'golf-variant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Jetta', 'jetta', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'LT', 'lt', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Lupo', 'lupo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Multivan', 'multivan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'New Beetle', 'new-beetle', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'New Beetle Cabrio', 'new-beetle-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Passat', 'passat', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Passat Alltrack', 'passat-alltrack', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Passat CC', 'passat-cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Passat Variant', 'passat-variant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Passat Variant Van', 'passat-variant-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Phaeton', 'phaeton', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Polo', 'polo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Polo Van', 'polo-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Polo Variant', 'polo-variant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Scirocco', 'scirocco', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Sharan', 'sharan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'T4', 't4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'T4 Caravelle', 't4-caravelle', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'T4 Multivan', 't4-multivan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'T5', 't5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'T5 Caravelle', 't5-caravelle', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'T5 Multivan', 't5-multivan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'T5 Transporter Shuttle', 't5-transporter-shuttle', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Tiguan', 'tiguan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Touareg', 'touareg', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volkswagen'), 'Touran', 'touran', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Suzuki
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Suzuki', 'suzuki', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Alto', 'alto', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Baleno', 'baleno', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Baleno kombi', 'baleno-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Grand Vitara', 'grand-vitara', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Grand Vitara XL-7', 'grand-vitara-xl-7', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Ignis', 'ignis', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Jimny', 'jimny', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Kizashi', 'kizashi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Liana', 'liana', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Samurai', 'samurai', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Splash', 'splash', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Swift', 'swift', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'SX4', 'sx4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'SX4 Sedan', 'sx4-sedan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Vitara', 'vitara', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'suzuki'), 'Wagon R+', 'wagon-r', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Mercedes-Benz
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Mercedes-Benz', 'mercedes-benz', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '100 D', '100-d', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '115', '115', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '124', '124', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '126', '126', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '190', '190', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '190 D', '190-d', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '190 E', '190-e', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '200 - 300', '200-300', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '200 D', '200-d', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '200 E', '200-e', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '210 Van', '210-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '210 kombi', '210-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '310 Van', '310-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '310 kombi', '310-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '230 - 300 CE Coupé', '230-300-ce-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '260 - 560 SE', '260-560-se', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '260 - 560 SEL', '260-560-sel', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), '500 - 600 SEC Coupé', '500-600-sec-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Trieda A', 'trieda-a', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'A', 'a', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'A L', 'a-l', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'AMG GT', 'amg-gt', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Trieda B', 'trieda-b', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Trieda C', 'trieda-c', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'C', 'c', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'C Sportcoupé', 'c-sportcoup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'C T', 'c-t', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Citan', 'citan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'CL', 'cl', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'CL', 'cl', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'CLA', 'cla', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'CLC', 'clc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'CLK Cabrio', 'clk-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'CLK Coupé', 'clk-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'CLS', 'cls', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Trieda E', 'trieda-e', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'E', 'e', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'E Cabrio', 'e-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'E Coupé', 'e-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'E T', 'e-t', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Trieda G', 'trieda-g', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'G Cabrio', 'g-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'GL', 'gl', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'GLA', 'gla', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'GLC', 'glc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'GLE', 'gle', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'GLK', 'glk', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Trieda M', 'trieda-m', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'MB 100', 'mb-100', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Trieda R', 'trieda-r', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Trieda S', 'trieda-s', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'S', 's', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'S Coupé', 's-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'SL', 'sl', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'SLC', 'slc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'SLK', 'slk', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'SLR', 'slr', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mercedes-benz'), 'Sprinter', 'sprinter', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Saab
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Saab', 'saab', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '9-3', '9-3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '9-3 Cabriolet', '9-3-cabriolet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '9-3 Coupé', '9-3-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '9-3 SportCombi', '9-3-sportcombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '9-5', '9-5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '9-5 SportCombi', '9-5-sportcombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '900', '900', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '900 C', '900-c', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '900 C Turbo', '900-c-turbo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'saab'), '9000', '9000', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Audi
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Audi', 'audi', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), '100', '100', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), '100 Avant', '100-avant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), '80', '80', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), '80 Avant', '80-avant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), '80 Cabrio', '80-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), '90', '90', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A1', 'a1', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A2', 'a2', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A3', 'a3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A3 Cabriolet', 'a3-cabriolet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A3 Limuzina', 'a3-limuzina', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A3 Sportback', 'a3-sportback', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A4', 'a4', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A4 Allroad', 'a4-allroad', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A4 Avant', 'a4-avant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A4 Cabriolet', 'a4-cabriolet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A5', 'a5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A5 Cabriolet', 'a5-cabriolet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A5 Sportback', 'a5-sportback', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A6', 'a6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A6 Allroad', 'a6-allroad', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A6 Avant', 'a6-avant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A7', 'a7', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A8', 'a8', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'A8 Long', 'a8-long', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'Q3', 'q3', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'Q5', 'q5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'Q7', 'q7', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'R8', 'r8', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'RS4 Cabriolet', 'rs4-cabriolet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'RS4/RS4 Avant', 'rs4rs4-avant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'RS5', 'rs5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'RS6 Avant', 'rs6-avant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'RS7', 'rs7', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'S3/S3 Sportback', 's3s3-sportback', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'S4 Cabriolet', 's4-cabriolet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'S4/S4 Avant', 's4s4-avant', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'S5/S5 Cabriolet', 's5s5-cabriolet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'S6/RS6', 's6rs6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'S7', 's7', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'S8', 's8', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'SQ5', 'sq5', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'TT Coupé', 'tt-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'TT Roadster', 'tt-roadster', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'audi'), 'TTS', 'tts', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Kia
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Kia', 'kia', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Avella', 'avella', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Besta', 'besta', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Carens', 'carens', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Carnival', 'carnival', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Cee`d', 'ceed', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Cee`d SW', 'ceed-sw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Cerato', 'cerato', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'K 2500', 'k-2500', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Magentis', 'magentis', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Opirus', 'opirus', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Optima', 'optima', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Picanto', 'picanto', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Pregio', 'pregio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Pride', 'pride', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Pro Cee`d', 'pro-ceed', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Rio', 'rio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Rio Combi', 'rio-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Rio sedan', 'rio-sedan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Sephia', 'sephia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Shuma', 'shuma', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Sorento', 'sorento', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Soul', 'soul', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Sportage', 'sportage', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'kia'), 'Venga', 'venga', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Land Rover
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Land Rover', 'land-rover', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'land-rover'), '109', '109', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'land-rover'), 'Defender', 'defender', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'land-rover'), 'Discovery', 'discovery', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'land-rover'), 'Discovery Sport', 'discovery-sport', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'land-rover'), 'Freelander', 'freelander', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'land-rover'), 'Range Rover', 'range-rover', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'land-rover'), 'Range Rover Evoque', 'range-rover-evoque', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'land-rover'), 'Range Rover Sport', 'range-rover-sport', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Dodge
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Dodge', 'dodge', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Avenger', 'avenger', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Caliber', 'caliber', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Challenger', 'challenger', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Charger', 'charger', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Grand Caravan', 'grand-caravan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Journey', 'journey', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Magnum', 'magnum', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Nitro', 'nitro', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'RAM', 'ram', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Stealth', 'stealth', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'dodge'), 'Viper', 'viper', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Chrysler
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Chrysler', 'chrysler', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), '300 C', '300-c', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), '300 C Touring', '300-c-touring', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), '300 M', '300-m', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Crossfire', 'crossfire', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Grand Voyager', 'grand-voyager', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'LHS', 'lhs', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Neon', 'neon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Pacifica', 'pacifica', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Plymouth', 'plymouth', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'PT Cruiser', 'pt-cruiser', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Sebring', 'sebring', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Sebring Convertible', 'sebring-convertible', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Stratus', 'stratus', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Stratus Cabrio', 'stratus-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Town & Country', 'town-country', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'chrysler'), 'Voyager', 'voyager', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Ford
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Ford', 'ford', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Aerostar', 'aerostar', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'B-Max', 'b-max', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'C-Max', 'c-max', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Cortina', 'cortina', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Cougar', 'cougar', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Edge', 'edge', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Escort', 'escort', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Escort Cabrio', 'escort-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Escort kombi', 'escort-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Explorer', 'explorer', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'F-150', 'f-150', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'F-250', 'f-250', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Fiesta', 'fiesta', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Focus', 'focus', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Focus C-Max', 'focus-c-max', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Focus CC', 'focus-cc', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Focus kombi', 'focus-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Fusion', 'fusion', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Galaxy', 'galaxy', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Grand C-Max', 'grand-c-max', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Ka', 'ka', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Kuga', 'kuga', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Maverick', 'maverick', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Mondeo', 'mondeo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Mondeo Combi', 'mondeo-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Mustang', 'mustang', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Orion', 'orion', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Puma', 'puma', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Ranger', 'ranger', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'S-Max', 's-max', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Sierra', 'sierra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Street Ka', 'street-ka', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Tourneo Connect', 'tourneo-connect', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Tourneo Custom', 'tourneo-custom', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit', 'transit', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit', 'transit', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit Bus', 'transit-bus', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit Connect LWB', 'transit-connect-lwb', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit Courier', 'transit-courier', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit Custom', 'transit-custom', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit kombi', 'transit-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit Tourneo', 'transit-tourneo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit Valnik', 'transit-valnik', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit Van', 'transit-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Transit Van 350', 'transit-van-350', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'ford'), 'Windstar', 'windstar', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Hummer
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Hummer', 'hummer', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'hummer'), 'H2', 'h2', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hummer'), 'H3', 'h3', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Hyundai
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Hyundai', 'hyundai', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Accent', 'accent', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Atos', 'atos', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Atos Prime', 'atos-prime', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Coupé', 'coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Elantra', 'elantra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Galloper', 'galloper', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Genesis', 'genesis', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Getz', 'getz', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Grandeur', 'grandeur', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'H 350', 'h-350', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'H1', 'h1', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'H1 Bus', 'h1-bus', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'H1 Van', 'h1-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'H200', 'h200', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'i10', 'i10', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'i20', 'i20', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'i30', 'i30', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'i30 CW', 'i30-cw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'i40', 'i40', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'i40 CW', 'i40-cw', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'ix20', 'ix20', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'ix35', 'ix35', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'ix55', 'ix55', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Lantra', 'lantra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Matrix', 'matrix', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Santa Fe', 'santa-fe', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Sonata', 'sonata', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Terracan', 'terracan', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Trajet', 'trajet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Tucson', 'tucson', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'hyundai'), 'Veloster', 'veloster', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Infiniti
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Infiniti', 'infiniti', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'infiniti'), 'EX', 'ex', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'infiniti'), 'FX', 'fx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'infiniti'), 'G', 'g', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'infiniti'), 'G Coupé', 'g-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'infiniti'), 'M', 'm', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'infiniti'), 'Q', 'q', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'infiniti'), 'QX', 'qx', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Jaguar
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Jaguar', 'jaguar', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'Daimler', 'daimler', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'F-Pace', 'f-pace', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'F-Type', 'f-type', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'S-Type', 's-type', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'Sovereign', 'sovereign', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'X-Type', 'x-type', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'X-type Estate', 'x-type-estate', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XE', 'xe', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XF', 'xf', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XJ', 'xj', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XJ12', 'xj12', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XJ6', 'xj6', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XJ8', 'xj8', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XJ8', 'xj8', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XJR', 'xjr', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XK', 'xk', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XK8 Convertible', 'xk8-convertible', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XKR', 'xkr', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jaguar'), 'XKR Convertible', 'xkr-convertible', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Jeep
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Jeep', 'jeep', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'jeep'), 'Cherokee', 'cherokee', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jeep'), 'Commander', 'commander', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jeep'), 'Compass', 'compass', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jeep'), 'Grand Cherokee', 'grand-cherokee', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jeep'), 'Patriot', 'patriot', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jeep'), 'Renegade', 'renegade', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'jeep'), 'Wrangler', 'wrangler', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Nissan
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Nissan', 'nissan', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), '100 NX', '100-nx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), '200 SX', '200-sx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), '350 Z', '350-z', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), '350 Z Roadster', '350-z-roadster', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), '370 Z', '370-z', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Almera', 'almera', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Almera Tino', 'almera-tino', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Cabstar E - T', 'cabstar-e-t', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Cabstar TL2 Valnik', 'cabstar-tl2-valnik', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'e-NV200', 'e-nv200', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'GT-R', 'gt-r', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Insterstar', 'insterstar', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Juke', 'juke', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'King Cab', 'king-cab', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Leaf', 'leaf', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Maxima', 'maxima', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Maxima QX', 'maxima-qx', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Micra', 'micra', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Murano', 'murano', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Navara', 'navara', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Note', 'note', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'NP300 Pickup', 'np300-pickup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'NV200', 'nv200', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'NV400', 'nv400', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Pathfinder', 'pathfinder', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Patrol', 'patrol', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Patrol GR', 'patrol-gr', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Pickup', 'pickup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Pixo', 'pixo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Primastar', 'primastar', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Primastar Combi', 'primastar-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Primera', 'primera', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Primera Combi', 'primera-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Pulsar', 'pulsar', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Qashqai', 'qashqai', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Serena', 'serena', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Sunny', 'sunny', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Terrano', 'terrano', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Tiida', 'tiida', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Trade', 'trade', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'Vanette Cargo', 'vanette-cargo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'nissan'), 'X-Trail', 'x-trail', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Volvo
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Volvo', 'volvo', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), '240', '240', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), '340', '340', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), '360', '360', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), '460', '460', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), '850', '850', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), '850 kombi', '850-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'C30', 'c30', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'C70', 'c70', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'C70 Cabrio', 'c70-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'C70 Coupé', 'c70-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'S40', 's40', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'S60', 's60', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'S70', 's70', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'S80', 's80', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'S90', 's90', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'V40', 'v40', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'V50', 'v50', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'V60', 'v60', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'V70', 'v70', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'V90', 'v90', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'XC60', 'xc60', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'XC70', 'xc70', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'volvo'), 'XC90', 'xc90', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Daewoo
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Daewoo', 'daewoo', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Espero', 'espero', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Kalos', 'kalos', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Lacetti', 'lacetti', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Lanos', 'lanos', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Leganza', 'leganza', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Lublin', 'lublin', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Matiz', 'matiz', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Nexia', 'nexia', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Nubira', 'nubira', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Nubira kombi', 'nubira-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Racer', 'racer', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Tacuma', 'tacuma', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'daewoo'), 'Tico', 'tico', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Fiat
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Fiat', 'fiat', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), '1100', '1100', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), '126', '126', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), '500', '500', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), '500L', '500l', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), '500X', '500x', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), '850', '850', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Barchetta', 'barchetta', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Brava', 'brava', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Cinquecento', 'cinquecento', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Coupé', 'coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Croma', 'croma', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Doblo', 'doblo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Doblo Cargo', 'doblo-cargo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Doblo Cargo Combi', 'doblo-cargo-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Ducato', 'ducato', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Ducato Van', 'ducato-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Ducato Kombi', 'ducato-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Ducato Podvozok', 'ducato-podvozok', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Florino', 'florino', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Florino Combi', 'florino-combi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Freemont', 'freemont', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Grande Punto', 'grande-punto', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Idea', 'idea', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Linea', 'linea', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Marea', 'marea', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Marea Weekend', 'marea-weekend', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Multipla', 'multipla', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Palio Weekend', 'palio-weekend', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Panda', 'panda', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Panda Van', 'panda-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Punto', 'punto', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Punto Cabriolet', 'punto-cabriolet', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Punto Evo', 'punto-evo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Punto Van', 'punto-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Qubo', 'qubo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Scudo', 'scudo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Scudo Van', 'scudo-van', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Scudo Kombi', 'scudo-kombi', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Sedici', 'sedici', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Seicento', 'seicento', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Stilo', 'stilo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Stilo Multiwagon', 'stilo-multiwagon', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Strada', 'strada', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Talento', 'talento', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Tipo', 'tipo', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Ulysse', 'ulysse', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'Uno', 'uno', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'fiat'), 'X1/9', 'x19', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- MINI
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('MINI', 'mini', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Cooper', 'cooper', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Cooper Cabrio', 'cooper-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Cooper Clubman', 'cooper-clubman', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Cooper D', 'cooper-d', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Cooper D Clubman', 'cooper-d-clubman', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Cooper S', 'cooper-s', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Cooper S Cabrio', 'cooper-s-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Cooper S Clubman', 'cooper-s-clubman', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Countryman', 'countryman', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'Mini One', 'mini-one', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'mini'), 'One D', 'one-d', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Rover
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Rover', 'rover', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '200', '200', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '214', '214', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '218', '218', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '25', '25', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '400', '400', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '414', '414', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '416', '416', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '620', '620', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'rover'), '75', '75', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

-- Smart
INSERT INTO public.vehicle_makes (name, slug, market_regions) 
VALUES ('Smart', 'smart', ARRAY['ES']) 
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES 
((SELECT id FROM public.vehicle_makes WHERE slug = 'smart'), 'Cabrio', 'cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'smart'), 'City-Coupé', 'city-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'smart'), 'Compact Pulse', 'compact-pulse', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'smart'), 'Forfour', 'forfour', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'smart'), 'Fortwo cabrio', 'fortwo-cabrio', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'smart'), 'Fortwo coupé', 'fortwo-coup', ARRAY['ES']),
((SELECT id FROM public.vehicle_makes WHERE slug = 'smart'), 'Roadster', 'roadster', ARRAY['ES'])
ON CONFLICT (make_id, slug) DO NOTHING;

COMMIT;