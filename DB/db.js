const { Pool } = require('pg');

const pool = new Pool({
  user: 'ubuntu',
  host: 'ec2-184-72-28-205.us-west-1.compute.amazonaws.com',
  database: 'product',
  password: 'ubuntu',
  port: 5432,
});

module.exports.pool = pool;
