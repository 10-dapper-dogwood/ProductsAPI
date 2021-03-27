const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'ec2-184-72-28-205.us-west-1.compute.amazonaws.com',
  database: 'product',
  password: '123',
  port: 5432,
  max: 100,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
});

// const pool = new Pool({
//   user: '',
//   host: 'localhost',
//   database: 'product',
//   password: '',
//   port: 5432,
// });

module.exports.pool = pool;
