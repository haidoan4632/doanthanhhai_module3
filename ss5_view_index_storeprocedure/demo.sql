-- bước 1:
CREATE DATABASE demo;
USE demo;
-- bước 2:
CREATE TABLE products (
id INT PRIMARY KEY,
product_code INT,
product_name VARCHAR(45),
product_price DOUBLE NOT NULL,
product_amount INT,
product_description VARCHAR(45),
product_status INT
);
INSERT INTO products (id, product_code, product_name, product_price, product_amount, product_description, product_status)
value (1, 100, 'cho', 2, 5, 'a', 0),
	(2, 101, 'meo', 3, 6, 'b', 1),
    (3, 102, 'ca', 7, 6, 'c', 1),
    (4, 103, 'lon', 1, 3, 'd', 2),
    (5, 104, 'vit', 2, 9, 'e', 0);
select*from products;  

-- bước 3:
explain select*from products