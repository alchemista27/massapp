const { Client } = require('pg');
require('dotenv').config();

(async () => {
  const client = new Client({
    connectionString: process.env.DATABASE_URL,
  });
  try {
    await client.connect();
    console.log('✅ DB Connection OK');
    const res = await client.query('SELECT * FROM users LIMIT 1');
    console.log('Sample User:', res.rows[0] || 'No data');
    await client.end();
  } catch (err) {
    console.error('❌ DB Connection Failed:', err.message);
    process.exit(1);
  }
})();
