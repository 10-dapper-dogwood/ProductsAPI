/* eslint-disable no-unused-expressions */
/* eslint-disable no-param-reassign */
const express = require('express');

const app = express();
const port = 3001;
const db = require('./db.js');

app.get('/products', (req, res) => {
  db.pool.query('SELECT * FROM products LIMIT 20', (err, data) => {
    if (err) {
      res.send(err);
    } else {
      res.send(data.rows);
    }
  });
});

app.get('/products/:p', (req, res) => {
  db.pool.query(`SELECT * FROM products where id=${req.params.p}`, (err, data) => {
    if (err) {
      res.send(err);
    } else {
      db.pool.query(`SELECT feature, value FROM features where product_id=${req.params.p}`, (e, d) => {
        if (e) {
          res.send(err);
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
      res.send(err);
    } else {
      db.pool.query(`SELECT * FROM skus WHERE style_id IN (SELECT id FROM styles where product_id=${req.params.p})`, (e, skus) => {
        if (e) {
          res.send(err);
        } else {
          db.pool.query(`SELECT * FROM photos WHERE style_id IN (SELECT id FROM styles where product_id=${req.params.p})`, (error, photos) => {
            if (error) {
              res.send(err);
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
  db.pool.query(`SELECT product_2 FROM related WHERE product_1=${req.params.p}`, (err, data) => {
    if (err) {
      res.send(err);
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
