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
    }
  });
});

app.get('/products/:p', (req, res) => {
  db.pool.query(`SELECT DISTINCT * FROM products where id=${req.params.p}`, (err, data) => {
    if (err) {
      throw err;
    } else {
      db.pool.query(`SELECT DISTINCT feature, value FROM features where product_id=${req.params.p}`, (e, d) => {
        if (e) {
          throw e;
        } else {
          data.rows[0].features = d.rows;
          res.send(data.rows[0]);
        }
      });
    }
  });
});

app.get('/products/:p/styles', (req, res) => {
  db.pool.query(`SELECT * FROM styles where product_id=${req.params.p}`, (err, styles) => {
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
              styles.rows.forEach((style) => {
                style.style_id = style.id;
                style.default_style ? style.default_style = true : style.default_style = false;
                style.skus = {};
                skus.rows.forEach((sku) => {
                  if (style.id === sku.style_id) {
                    style.skus[sku.id] = sku;
                    delete sku.id;
                    delete sku.style_id;
                  }
                });
                style.photos = [];
                photos.rows.forEach((photo) => {
                  if (style.id === photo.style_id) {
                    style.photos.push(photo);
                    delete photo.id;
                    delete photo.style_id;
                  }
                });
                delete style.id;
                delete style.product_id;
              });
              res.send({
                product_id: req.params.p,
                results: styles.rows,
              });
            }
          });
        }
      });
    }
  });
});

app.get('/products/:p/related', (req, res) => {
  db.pool.query(`SELECT DISTINCT product_2 FROM related WHERE product_1=${req.params.p}`, (err, data) => {
    if (err) {
      throw err;
    } else {
      const related = [];
      data.rows.forEach((item) => related.push(item.product_2));
      res.send(related);
    }
  });
});

app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`Example app listening at http://localhost:${port}`);
});
