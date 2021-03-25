const { Pool } = require('pg');

const pool = new Pool({
  user: 'ubuntu',
  host: 'localhost',
  database: 'product',
  password: 'ubuntu',
  port: 5432,
});

module.exports.pool = pool;
