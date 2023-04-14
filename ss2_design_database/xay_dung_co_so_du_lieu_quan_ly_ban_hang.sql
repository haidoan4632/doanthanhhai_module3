-- drop database if exists building_sales_management;
CREATE DATABASE building_sales_management;
USE building_sales_management;
CREATE TABLE customer (
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(45) NOT NULL,
    c_age VARCHAR(45) NOT NULL,
    CHECK (c_age > 18)
);

CREATE TABLE order1 (
    o_id INT PRIMARY KEY AUTO_INCREMENT,
    c_id INT,
    o_date DATE NOT NULL,
    o_total_price INT NOT NULL,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);

CREATE TABLE product (
    p_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(45) NOT NULL,
    p_price INT NOT NULL
);


CREATE TABLE order_detail (
    o_id INT,
    p_id INT,
    od_qty INT NOT NULL,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES order1 (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);
