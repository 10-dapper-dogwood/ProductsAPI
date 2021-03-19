-- ---
-- Tables
-- ---

-- DROP TABLE IF EXISTS products;
		
-- CREATE TABLE products (
--   id INTEGER NULL DEFAULT NULL,
--   name VARCHAR NULL DEFAULT NULL,
--   slogan VARCHAR NULL DEFAULT NULL,
--   description VARCHAR NULL DEFAULT NULL,
--   category VARCHAR NULL DEFAULT NULL,
--   default_price VARCHAR NULL DEFAULT NULL,
--   PRIMARY KEY (id)
-- );

-- DROP TABLE IF EXISTS styles;
		
-- CREATE TABLE styles (
--   id INTEGER NULL DEFAULT NULL,
--   product_id INTEGER NULL DEFAULT NULL,
--   name VARCHAR NULL DEFAULT NULL,
--   sale_price VARCHAR NULL DEFAULT NULL,
--   original_price VARCHAR NULL DEFAULT NULL,
--   default_style INTEGER NULL DEFAULT NULL,
--   PRIMARY KEY (id)
-- );


-- DROP TABLE IF EXISTS features;
		
-- CREATE TABLE features (
--   id INTEGER NULL DEFAULT NULL,
--   product_id INTEGER NULL DEFAULT NULL,
--   feature VARCHAR NULL DEFAULT NULL,
--   value VARCHAR NULL DEFAULT NULL,
--   PRIMARY KEY (id)
-- );

-- DROP TABLE IF EXISTS photos;
		
-- CREATE TABLE photos (
--   id INTEGER NULL DEFAULT NULL,
--   style_id INTEGER NULL DEFAULT NULL,
--   url url,
--   thumbnail_url url
-- );


-- DROP TABLE IF EXISTS skus;
		
-- CREATE TABLE skus (
--   id VARCHAR NULL,
--   style_id INTEGER NULL DEFAULT NULL,
--   size VARCHAR NULL DEFAULT NULL,
--   quantity INTEGER NULL DEFAULT NULL,
--   PRIMARY KEY (id)
-- );



-- DROP TABLE IF EXISTS related;
		
-- CREATE TABLE related (
--   id INTEGER NULL,
--   product_1 INTEGER NULL DEFAULT NULL,
--   product_2 INTEGER NULL DEFAULT NULL,
--   PRIMARY KEY (id)
-- );

-- ---
-- Foreign Keys 
-- ---

-- ALTER TABLE styles ADD FOREIGN KEY (product_id) REFERENCES products (id);
-- ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES products (id);
-- ALTER TABLE photos ADD FOREIGN KEY (style_id) REFERENCES styles (id);
-- ALTER TABLE skus ADD FOREIGN KEY (style_id) REFERENCES styles (id);
-- ALTER TABLE related ADD FOREIGN KEY (product_2) REFERENCES products (id);
-- ALTER TABLE related ADD FOREIGN KEY (product_1) REFERENCES products (id);

-- ---
-- CSV IMPORT STATEMENTS
-- ---

-- COPY Features
-- FROM '/Users/nilaipatel/Documents/HackReactor/SDC/ProductsAPI/csv/features.csv'
-- with (FORMAT csv);

-- COPY photos
-- FROM '/Users/nilaipatel/Documents/HackReactor/SDC/ProductsAPI/csv/photos.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY Products
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

-- CREATE INDEX product_id_features ON Features (product_id);
-- CREATE INDEX id_products ON products (id);
-- CREATE INDEX products_1_related ON related (product_1);
-- CREATE INDEX product_id_styles ON styles (product_id);
-- CREATE INDEX style_id_photos ON photos (style_id);
-- CREATE INDEX skus_id_photos ON skus (style_id);

-- ---
-- DOMAINS
-- ---

-- CREATE DOMAIN url AS text CHECK (VALUE ~ 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,255}\.[a-z]{2,9}\y([-a-zA-Z0-9@:%_\+.,~#?!&>//=]*)$');

-- ---
-- SEARCH QUERIES
-- ---

-- SELECT * FROM skus WHERE EXISTS (SELECT id FROM styles where product_id=7 );
-- SELECT * FROM skus INNER JOIN photos ON skus.style_id=photos.style_id WHERE skus.style_id IN (SELECT id FROM styles where product_id=100 );

-- ---
-- EXPLAIN ANALYZE (SEARCH QUERY)
-- ---