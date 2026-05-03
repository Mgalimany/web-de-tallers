-- Update province and autonomous community based on Spanish postal codes
-- Spanish postal codes have 5 digits. The first 2 digits indicate the province.

with province_mapping as (
  select * from (values
    ('01', 'Álava', 'País Vasco'),
    ('02', 'Albacete', 'Castilla-La Mancha'),
    ('03', 'Alicante', 'Comunidad Valenciana'),
    ('04', 'Almería', 'Andalucía'),
    ('05', 'Ávila', 'Castilla y León'),
    ('06', 'Badajoz', 'Extremadura'),
    ('07', 'Islas Baleares', 'Islas Baleares'),
    ('08', 'Barcelona', 'Cataluña'),
    ('09', 'Burgos', 'Castilla y León'),
    ('10', 'Cáceres', 'Extremadura'),
    ('11', 'Cádiz', 'Andalucía'),
    ('12', 'Castellón', 'Comunidad Valenciana'),
    ('13', 'Ciudad Real', 'Castilla-La Mancha'),
    ('14', 'Córdoba', 'Andalucía'),
    ('15', 'La Coruña', 'Galicia'),
    ('16', 'Cuenca', 'Castilla-La Mancha'),
    ('17', 'Girona', 'Cataluña'),
    ('18', 'Granada', 'Andalucía'),
    ('19', 'Guadalajara', 'Castilla-La Mancha'),
    ('20', 'Guipúzcoa', 'País Vasco'),
    ('21', 'Huelva', 'Andalucía'),
    ('22', 'Huesca', 'Aragón'),
    ('23', 'Jaén', 'Andalucía'),
    ('24', 'León', 'Castilla y León'),
    ('25', 'Lleida', 'Cataluña'),
    ('26', 'La Rioja', 'La Rioja'),
    ('27', 'Lugo', 'Galicia'),
    ('28', 'Madrid', 'Comunidad de Madrid'),
    ('29', 'Málaga', 'Andalucía'),
    ('30', 'Murcia', 'Región de Murcia'),
    ('31', 'Navarra', 'Comunidad Foral de Navarra'),
    ('32', 'Ourense', 'Galicia'),
    ('33', 'Asturias', 'Principado de Asturias'),
    ('34', 'Palencia', 'Castilla y León'),
    ('35', 'Las Palmas', 'Canarias'),
    ('36', 'Pontevedra', 'Galicia'),
    ('37', 'Salamanca', 'Castilla y León'),
    ('38', 'Santa Cruz de Tenerife', 'Canarias'),
    ('39', 'Cantabria', 'Cantabria'),
    ('40', 'Segovia', 'Castilla y León'),
    ('41', 'Sevilla', 'Andalucía'),
    ('42', 'Soria', 'Castilla y León'),
    ('43', 'Tarragona', 'Cataluña'),
    ('44', 'Teruel', 'Aragón'),
    ('45', 'Toledo', 'Castilla-La Mancha'),
    ('46', 'Valencia', 'Comunidad Valenciana'),
    ('47', 'Valladolid', 'Castilla y León'),
    ('48', 'Vizcaya', 'País Vasco'),
    ('49', 'Zamora', 'Castilla y León'),
    ('50', 'Zaragoza', 'Aragón'),
    ('51', 'Ceuta', 'Ceuta'),
    ('52', 'Melilla', 'Melilla')
  ) as m(prefix, prov, auto_com)
)
update public.workshops w
set
  province = pm.prov,
  autonomous_community = pm.auto_com
from province_mapping pm
where w.postal_code is not null
  and w.province is null
  and w.country_code = 'ES'
  and pm.prefix = substring(lpad(w.postal_code, 5, '0'), 1, 2);

-- Attempt to extract province directly from OSM raw attributes for those without postal code
update public.workshops
set province = raw_attributes->>'addr:province'
where postal_code is null
  and province is null
  and raw_attributes->>'addr:province' is not null;
