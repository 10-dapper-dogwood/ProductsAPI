const { Pool } = require('pg');

const pool = new Pool({
  user: '',
  host: 'localhost',
  database: 'product',
  password: '',
  port: 5432,
});

module.exports.pool = pool;
