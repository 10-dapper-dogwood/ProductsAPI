const express = require('express');
const format = require('pg-format');

const app = express();
const port = 3001;
const db = require('../DB/db.js');

app.get('/products', (req, res) => {
  const queryString = format('SELECT * FROM products LIMIT 20');
  db.connect((err, client, release) => {
    if (err) {
      res.status(404).send(err.stack);
    }
    client.query(queryString, (error, data) => {
      release();
      if (error) {
        res.send(error);
      } else {
        res.send(data.rows);
      }
    });
  });
});

app.get('/products/:p', (req, res) => {
  const queryString = format("SELECT products.*, ARRAY_AGG(json_build_object('feature', features.feature, 'value',  features.value)) AS features FROM products JOIN features ON products.id = features.product_id WHERE products.id = %L GROUP BY products.id", req.params.p);
  db.connect((err, client, release) => {
    if (err) {
      res.status(404).send(err.stack);
    }
    client.query(queryString, (error, data) => {
      release();
      if (error) {
        res.send(error);
      } else {
        res.send(data.rows);
      }
    });
  });
});

app.get('/products/:p/styles', (req, res) => {
  const queryString = format("SELECT styles.name, styles.sale_price, styles.original_price, styles.default_style, styles.id AS style_id, json_object_agg(skus.id, json_build_object('size', skus.size, 'quantity', skus.quantity)) AS skus, ARRAY_AGG(json_build_object('url', photos.url, 'thumbnail_url', photos.thumbnail_url)) AS photos FROM styles JOIN skus ON styles.id = skus.style_id JOIN photos ON styles.id = photos.style_id WHERE styles.product_id=%L  GROUP BY styles.id", req.params.p);
  db.connect((err, client, release) => {
    if (err) {
      res.status(404).send(err.stack);
    }
    client.query(queryString, (error, data) => {
      release();
      if (error) {
        res.send(error);
      } else {
        res.send({
          product_id: req.params.p,
          results: data.rows,
        });
      }
    });
  });
});

app.get('/products/:p/related', (req, res) => {
  const queryString = format('SELECT array_agg(product_2) AS related FROM related WHERE product_1=%L', req.params.p);
  db.connect((err, client, release) => {
    release();
    if (err) {
      res.status(404).send(err.stack);
    }
    client.query(queryString, (error, data) => {
      if (error) {
        res.send(error);
      } else {
        res.send(data.rows[0].related);
      }
    });
  });
});

app.get('/loaderio-748250a6cadd4b1190a5102275d3eba1', (req, res) => {
  res.send('loaderio-748250a6cadd4b1190a5102275d3eba1');
});

app.listen(port, () => {
  // console.log(`Example app listening at http://localhost:${port}`);
});
