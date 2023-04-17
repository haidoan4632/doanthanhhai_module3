-- bước 1:
CREATE DATABASE demo;
USE demo;
-- bước 2:
CREATE TABLE products (
id INT PRIMARY KEY,
product_code INT,
product_name VARCHAR(45) NOT NULL,
product_price DOUBLE NOT NULL,
product_amount INT NOT NULL,
product_description VARCHAR(45) NOT NULL,
product_status INT NOT NULL
);
INSERT INTO products (id, product_code, product_name, product_price, product_amount, product_description, product_status)
value (1, 100, 'cho', 2, 5, 'a', 0),
	(2, 101, 'meo', 3, 6, 'b', 1),
    (3, 102, 'ca', 7, 6, 'c', 1),
    (4, 103, 'lon', 1, 3, 'd', 2),
    (5, 104, 'vit', 2, 9, 'e', 0);
SELECT* FROM products;  

-- bước 3:
EXPLAIN SELECT * FROM products;
CREATE INDEX unique_index ON products  (product_code);
CREATE INDEX  composite_index ON products(product_name, product_price);


-- bước 4:
CREATE VIEW v_products ( product_code, product_name, product_price, product_status) AS
SELECT product_code, product_name, product_price, product_status FROM products;
SELECT * FROM v_products
ORDER BY  product_code;

UPDATE v_products SET product_name = 'hai'
WHERE product_name = 'cho';
DELETE FROM v_products 
WHERE product_name = 'meo';

DELETE FROM v_products 
WHERE product_name = 'vit';

-- bước 5:
delimiter //
CREATE PROCEDURE display_products ()
BEGIN
SELECT * FROM products;
END //
delimiter ;  

delimiter //
CREATE PROCEDURE edit_products (IN id INT, product_name varchar (45), product_price double)
begin
	UPDATE products SET product_name = 'hai', product_price = '1' WHERE id = 1;
	SELECT 
    *
FROM
    products;
END //
delimiter ; 
delimiter //
CREATE PROCEDURE edit_products (IN id INT, product_name VARCHAR(45), product_price DOUBLE)
BEGIN
	UPDATE products SET product_name = 'hai', product_price = '1' WHERE id = 1;
	SELECT * FROM products;
END //
delimiter ; 

delimiter //
CREATE PROCEDURE delete_products (IN id INT)
BEGIN
	DELETE FROM products WHERE id = 3;
	SELECT 
    *
FROM
    products;
END //
delimiter ; 