const { Pool } = require('pg');

const pool = new Pool({
  user: 'massapp',
  host: 'localhost',
  database: 'massappdb',
  password: 'Curup1991',
  port: 5432,
});

module.exports = pool;
