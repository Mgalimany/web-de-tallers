const fs = require('fs');

const geojson = JSON.parse(fs.readFileSync('spain_provinces.json', 'utf8'));

let sql = `-- Migration to add Spain provinces polygons for PostGIS intersection\n\n`;
sql += `create table if not exists public.spain_provinces (\n`;
sql += `  id serial primary key,\n`;
sql += `  name text not null,\n`;
sql += `  geom extensions.geometry(Geometry, 4326) not null\n`;
sql += `);\n\n`;

sql += `create index if not exists spain_provinces_geom_idx on public.spain_provinces using gist(geom);\n\n`;

// Clear existing to be safe
sql += `truncate table public.spain_provinces;\n\n`;

geojson.features.forEach((feature) => {
  const name = feature.properties.name.replace(/'/g, "''");
  // We insert using ST_GeomFromGeoJSON
  const geomJson = JSON.stringify(feature.geometry).replace(/'/g, "''");
  sql += `insert into public.spain_provinces (name, geom)\n`;
  sql += `values ('${name}', extensions.ST_SetSRID(extensions.ST_GeomFromGeoJSON('${geomJson}'), 4326));\n`;
});

sql += `\n`;
sql += `-- Auto-fill missing provinces based on spatial intersection
update public.workshops w
set province = p.name
from public.spain_provinces p
where w.province is null
  and w.postal_code is null
  and w.municipality is null
  and extensions.ST_Contains(p.geom, w.location::extensions.geometry);
`;

fs.writeFileSync('supabase/migrations/202605030003_spain_provinces_postgis.sql', sql);
console.log('SQL migration file generated successfully.');
