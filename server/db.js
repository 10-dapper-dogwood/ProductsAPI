const { Pool } = require('pg');

const pool = new Pool({
  user: 'root',
  host: 'db',
  database: 'product',
  password: '',
  port: 5432,
});

module.exports.pool = pool;
