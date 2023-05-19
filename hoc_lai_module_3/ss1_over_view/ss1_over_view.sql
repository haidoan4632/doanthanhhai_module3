CREATE DATABASE book_management;
USE book_management;
CREATE TABLE books(
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
page_size INT NOT NULL,
author VARCHAR(45) NOT NULL
);

INSERT INTO books(`name`,page_size,author)
VALUES("Toán",45,"Nguyễn Thái Học"),
("Văn",34,"Trần Mình Hoàng"),
("Sử",56,"Dương Trung Quốc"),
("Địa",76,"Lê Văn Hiến"),
("Hóa",32,"Hà Văn Minh");

set sql_safe_updates=0;
UPDATE books
SET page_size = 50
WHERE books.`name` = "sử";
set sql_safe_updates=1;

