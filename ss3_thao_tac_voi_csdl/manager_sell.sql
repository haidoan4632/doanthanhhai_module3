CREATE DATABASE quan_ly_ban_hang_san_pham;
USE quan_ly_ban_hang_san_pham;

CREATE TABLE customer (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(25),
    c_age TINYINT
);

CREATE TABLE order_product (
    o_id INT PRIMARY KEY,
    c_id INT,
    o_date DATE,
    o_total_price INT,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);
CREATE TABLE product (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(25),
    p_price INT
);
CREATE TABLE order_detail (
    o_id INT,
    p_id INT,
    od_qty INT,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id),
    FOREIGN KEY (o_id)
        REFERENCES order_product (o_id)
);
INSERT INTO customer
VALUES (1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
INSERT INTO order_product
VALUES(1,1,'2006-03-21',NULL),
(2,2,'2006-03-23',NULL),
(3,1,'2006-03-16',NULL);
INSERT INTO product
VALUES(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);
INSERT INTO order_detail
VALUES(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT c_id, o_date, o_total_price FROM order_product;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    customer.c_name, product.p_name
FROM
    customer
        INNER JOIN
    order_product ON customer.c_id = order_product.c_id
        INNER JOIN
    order_detail ON order_product.o_id = order_detail.o_id
        INNER JOIN
    product ON order_detail.p_id = product.p_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    customer.c_name
FROM
    customer
        LEFT JOIN
    order_product ON customer.c_id = order_product.c_id
WHERE
    order_product.c_id IS NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    order_product.o_id,
    o_date,
    SUM(product.p_price * order_detail.od_qty) AS total_price
FROM
    order_product
        INNER JOIN
    order_detail ON order_product.o_id = order_detail.o_id
        INNER JOIN
    product ON order_detail.p_id = product.p_id
GROUP BY order_product.o_id;
