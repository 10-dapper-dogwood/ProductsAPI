-- CREATE DATABASE product;

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

-- CREATE DOMAIN url AS text CHECK (VALUE ~ 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,255}\.[a-z]{2,9}\y([-a-zA-Z0-9@:%_\+.,~#?!&>//=]*)$');

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
