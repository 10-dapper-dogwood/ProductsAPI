-- ---
-- Tables
-- ---



-- DROP TABLE IF EXISTS Products;
		
-- CREATE TABLE Products (
--   id INTEGER NULL DEFAULT NULL,
--   name VARCHAR NULL DEFAULT NULL,
--   slogan VARCHAR NULL DEFAULT NULL,
--   description VARCHAR NULL DEFAULT NULL,
--   category VARCHAR NULL DEFAULT NULL,
--   default_price VARCHAR NULL DEFAULT NULL,
--   PRIMARY KEY (id)
-- );

-- DROP TABLE IF EXISTS Styles;
		
-- CREATE TABLE Styles (
--   id INTEGER NULL DEFAULT NULL,
--   product_id INTEGER NULL DEFAULT NULL,
--   name VARCHAR NULL DEFAULT NULL,
--   sale_price VARCHAR NULL DEFAULT NULL,
--   original_price VARCHAR NULL DEFAULT NULL,
--   default_style INTEGER NULL DEFAULT NULL,
--   PRIMARY KEY (id)
-- );


-- DROP TABLE IF EXISTS Features;
		
-- CREATE TABLE Features (
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
--   url VARCHAR NULL DEFAULT NULL,
--   thumbnail_url VARCHAR NULL DEFAULT NULL
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

-- ALTER TABLE Styles ADD FOREIGN KEY (product_id) REFERENCES Products (id);
-- ALTER TABLE Features ADD FOREIGN KEY (product_id) REFERENCES Products (id);
-- ALTER TABLE photos ADD FOREIGN KEY (style_id) REFERENCES Styles (id);
-- ALTER TABLE skus ADD FOREIGN KEY (style_id) REFERENCES Styles (id);
-- ALTER TABLE related ADD FOREIGN KEY (product_2) REFERENCES Products (id);
-- ALTER TABLE related ADD FOREIGN KEY (product_1) REFERENCES Products (id);

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

