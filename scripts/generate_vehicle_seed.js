const fs = require('fs');
const https = require('https');

const url = 'https://raw.githubusercontent.com/matthlavacka/car-list/master/car-list.json';

function slugify(text) {
  return text.toString().toLowerCase()
    .replace(/\s+/g, '-')           // Replace spaces with -
    .replace(/[^\w\-]+/g, '')       // Remove all non-word chars
    .replace(/\-\-+/g, '-')         // Replace multiple - with single -
    .replace(/^-+/, '')             // Trim - from start of text
    .replace(/-+$/, '');            // Trim - from end of text
}

https.get(url, (res) => {
  let data = '';
  res.on('data', (chunk) => { data += chunk; });
  res.on('end', () => {
    try {
      let json;
      try {
        json = JSON.parse(data);
      } catch (e) {
        const wrapped = '[' + data.trim().split('\n').join(',') + ']';
        json = JSON.parse(wrapped);
      }

      let sql = '-- Seed vehicle makes and models\n';
      sql += 'BEGIN;\n\n';

      json.forEach((item) => {
        const brand = item.brand;
        const brandSlug = slugify(brand);
        
        sql += `-- ${brand}\n`;
        sql += `INSERT INTO public.vehicle_makes (name, slug, market_regions) \n`;
        sql += `VALUES ('${brand.replace(/'/g, "''")}', '${brandSlug}', ARRAY['ES']) \n`;
        sql += `ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name;\n\n`;

        if (item.models && item.models.length > 0) {
          const batchSize = 50;
          for (let i = 0; i < item.models.length; i += batchSize) {
            const batch = item.models.slice(i, i + batchSize);
            sql += `INSERT INTO public.vehicle_models (make_id, name, slug, market_regions) VALUES \n`;
            const modelValues = batch.map(model => {
              const modelSlug = slugify(model);
              return `((SELECT id FROM public.vehicle_makes WHERE slug = '${brandSlug}'), '${model.replace(/'/g, "''")}', '${modelSlug}', ARRAY['ES'])`;
            });
            sql += modelValues.join(',\n') + '\n';
            sql += `ON CONFLICT (make_id, slug) DO NOTHING;\n\n`;
          }
        }
      });

      sql += 'COMMIT;';
      fs.writeFileSync('supabase/migrations/202605040001_seed_vehicle_catalog.sql', sql);
      console.log('SQL seed file generated: supabase/migrations/202605040001_seed_vehicle_catalog.sql');
    } catch (err) {
      console.error('Error processing JSON:', err);
    }
  });
}).on('error', (err) => {
  console.error('Error downloading JSON:', err);
});
