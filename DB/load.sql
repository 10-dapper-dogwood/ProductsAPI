-- COPY features
-- FROM '/home/ubuntu/SDC/ProductsAPI/cv/features.csv'
-- with (FORMAT csv);

-- COPY photos
-- FROM '/home/ubuntu/SDC/ProductsAPI/cv/photos-clean.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY products
-- FROM '/home/ubuntu/SDC/ProductsAPI/cv/product.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY styles
-- FROM '/home/ubuntu/SDC/ProductsAPI/cv/styles.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY skus
-- FROM '/home/ubuntu/SDC/ProductsAPI/cv/skus.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY related
-- FROM '/home/ubuntu/SDC/ProductsAPI/cv/related.csv'
-- DELIMITER ','
-- CSV HEADER;

-- ALTER TABLE styles ADD FOREIGN KEY (product_id) REFERENCES products (id);
-- ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES products (id);
-- ALTER TABLE photos ADD FOREIGN KEY (style_id) REFERENCES styles (id);
-- ALTER TABLE skus ADD FOREIGN KEY (style_id) REFERENCES styles (id);
-- ALTER TABLE related ADD FOREIGN KEY (product_2) REFERENCES products (id);
-- ALTER TABLE related ADD FOREIGN KEY (product_1) REFERENCES products (id);

-- CREATE INDEX product_id_features ON features (product_id);
-- CREATE INDEX id_products ON products (id);
-- CREATE INDEX products_1_related ON related (product_1);
-- CREATE INDEX product_id_styles ON styles (product_id);
-- CREATE INDEX style_id_photos ON photos (style_id);
-- CREATE INDEX skus_id_photos ON skus (style_id);