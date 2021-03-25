-- ---
-- Tables
-- ---

CREATE DOMAIN url AS text CHECK (VALUE ~ 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,255}\.[a-z]{2,9}\y([-a-zA-Z0-9@:%_\+.,~#?!&>//=]*)$');

DROP TABLE IF EXISTS products;
		
CREATE TABLE products (
  id INTEGER NULL DEFAULT NULL,
  name VARCHAR NULL DEFAULT NULL,
  slogan VARCHAR NULL DEFAULT NULL,
  description VARCHAR NULL DEFAULT NULL,
  category VARCHAR NULL DEFAULT NULL,
  default_price VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS styles;
		
CREATE TABLE styles (
  id INTEGER NULL DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  name VARCHAR NULL DEFAULT NULL,
  sale_price VARCHAR NULL DEFAULT NULL,
  original_price VARCHAR NULL DEFAULT NULL,
  default_style INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS features;
		
CREATE TABLE features (
  id INTEGER NULL DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  feature VARCHAR NULL DEFAULT NULL,
  value VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id INTEGER NULL DEFAULT NULL,
  style_id INTEGER NULL DEFAULT NULL,
  url url,
  thumbnail_url url
);


DROP TABLE IF EXISTS skus;
		
CREATE TABLE skus (
  id VARCHAR NULL,
  style_id INTEGER NULL DEFAULT NULL,
  size VARCHAR NULL DEFAULT NULL,
  quantity INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);



DROP TABLE IF EXISTS related;
		
CREATE TABLE related (
  id INTEGER NULL,
  product_1 INTEGER NULL DEFAULT NULL,
  product_2 INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE styles ADD FOREIGN KEY (product_id) REFERENCES products (id);
ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES products (id);
ALTER TABLE photos ADD FOREIGN KEY (style_id) REFERENCES styles (id);
ALTER TABLE skus ADD FOREIGN KEY (style_id) REFERENCES styles (id);
ALTER TABLE related ADD FOREIGN KEY (product_2) REFERENCES products (id);
ALTER TABLE related ADD FOREIGN KEY (product_1) REFERENCES products (id);

-- ---
-- CSV IMPORT STATEMENTS
-- ---

-- COPY features
-- FROM '/Users/nilaipatel/Documents/HackReactor/SDC/ProductsAPI/csv/features.csv'
-- with (FORMAT csv);

-- COPY photos
-- FROM '/Users/nilaipatel/Documents/HackReactor/SDC/ProductsAPI/csv/photos.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY products
-- FROM '/Users/nilaipatel/Documents/HackReactor/SDC/ProductsAPI/csv/product.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY Styles
-- FROM '/Users/nilaipatel/Documents/HackReactor/SDC/ProductsAPI/csv/styles.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY skus
-- FROM '/Users/nilaipatel/Documents/HackReactor/SDC/ProductsAPI/csv/skus.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY related
-- FROM '/Users/nilaipatel/Documents/HackReactor/SDC/ProductsAPI/csv/related.csv'
-- DELIMITER ','
-- CSV HEADER;

-- ---
-- INDEX QUERIES
-- ---

CREATE INDEX product_id_features ON features (product_id);
CREATE INDEX id_products ON products (id);
CREATE INDEX products_1_related ON related (product_1);
CREATE INDEX product_id_styles ON styles (product_id);
CREATE INDEX style_id_photos ON photos (style_id);
CREATE INDEX skus_id_photos ON skus (style_id);

-- ---
-- DOMAINS
-- ---

-- CREATE DOMAIN url AS text CHECK (VALUE ~ 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,255}\.[a-z]{2,9}\y([-a-zA-Z0-9@:%_\+.,~#?!&>//=]*)$');

-- ---
-- SEARCH QUERIES
-- ---

-- SELECT * FROM skus WHERE EXISTS (SELECT id FROM styles where product_id=7 );
-- SELECT * FROM skus INNER JOIN photos ON skus.style_id=photos.style_id WHERE skus.style_id IN (SELECT id FROM styles where product_id=100 );
-- AUDREES QUERIE
-- SELECT answers.id, question_id, body, date_written, answerer_name, answerer_email, reported, helpful, ARRAY_AGG(photo) as photos FROM answers LEFT JOIN photos ON answers.id = photos.answer_id WHERE answers.id IN (SELECT id FROM answers WHERE question_id = %L AND reported IS false) GROUP BY answers.id, question_id, body, date_written, answerer_name, answerer_email, reported, helpful ORDER BY date_written
-- SELECT products.*, ARRAY_AGG(json_build_object('feature', features.feature, 'value',  features.value)) AS features FROM products JOIN features ON products.id = features.product_id WHERE products.id = 1234 GROUP BY products.id;
-- SELECT styles.name, styles.sale_price, styles.original_price, styles.default_style, styles.id AS style_id,
-- json_object_agg(skus.id, json_build_object('size', skus.size, 'quantity', skus.quantity)) AS skus,
-- ARRAY_AGG(json_build_object('url', photos.url, 'thumbnail_url', photos.thumbnail_url)) AS photos
-- FROM styles JOIN skus ON styles.id = skus.style_id 
-- JOIN photos ON styles.id = photos.style_id
-- WHERE styles.product_id = 1234347
-- GROUP BY styles.id; 


-- ---
-- EXPLAIN ANALYZE (SEARCH QUERY)
-- ---