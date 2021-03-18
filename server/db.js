const { Pool } = require('pg')

const pool = new Pool({
  user: '',
  host: 'localhost',
  database: 'product',
  password: '',
  port: 5432,
})


pool.query('SELECT * FROM Features', (err, res) => {
  console.log(err, res)
  pool.end()
})

module.exports.pool = pool;