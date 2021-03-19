/* eslint-disable no-param-reassign */
const express = require('express');

const app = express();
const port = 3000;
const db = require('./db.js');

app.get('/products', (req, res) => {
  db.pool.query('SELECT * FROM products LIMIT 20', (err, data) => {
    if (err) {
      throw err;
    } else {
      res.send(data.rows);
      db.pool.end();
    }
  });
});

app.get('/products/:p', (req, res) => {
  db.pool.query(`SELECT * FROM products where id=${req.params.p}`, (err, data) => {
    if (err) {
      throw err;
    } else {
      db.pool.query(`SELECT feature, value FROM features where product_id=${req.params.p}`, (e, d) => {
        if (e) {
          throw e;
        } else {
          data.rows[0].features = d.rows;
          res.send(data.rows[0]);
          db.pool.end();
        }
      });
    }
  });
});

app.get('/products/:p/styles', (req, res) => {
  db.pool.query(`SELECT * FROM styles where product_id=${req.params.p}`, (err, style) => {
    if (err) {
      throw err;
    } else {
      db.pool.query(`SELECT * FROM skus WHERE style_id IN (SELECT id FROM styles where product_id=${req.params.p})`, (e, skus) => {
        if (e) {
          throw e;
        } else {
          db.pool.query(`SELECT * FROM photos WHERE style_id IN (SELECT id FROM styles where product_id=${req.params.p})`, (error, photos) => {
            if (error) {
              throw error;
            } else {
              console.log(style.rows, skus.rows, photos.rows);
              res.send('hello');
              db.pool.end();
            }
          });
        }
      });
    }
  });
});

app.get('/products/:p/related', (req, res) => {
  db.pool.query(`SELECT product_2 FROM related WHERE product_1=${req.params.p}`, (err, data) => {
    if (err) {
      throw err;
    } else {
      const related = [];
      data.rows.forEach((item) => related.push(item.product_2));
      res.send(related);
      db.pool.end();
    }
  });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
