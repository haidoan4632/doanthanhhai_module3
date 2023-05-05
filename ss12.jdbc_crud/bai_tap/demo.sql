CREATE DATABASE demo1;
USE demo1;
CREATE TABLE users(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(120) NOT NULL,
email VARCHAR(220) NOT NULL,
country VARCHAR(120),
PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

USE demo1;
SELECT * FROM users WHERE country LIKE "Đà Nẵng";

DELIMITER //
CREATE PROCEDURE hien_thi() 
SELECT * FROM demo1.users;
END //
DELIMITER ;
 CALL hien_thi();
 
 DELIMITER //
 CREATE PROCEDURE edit_user(in id_1 INT, in name_1 VARCHAR(50), in email_1 VARCHAR(50),in country_1 VARCHAR(50))
 UPDATE users SET name = name_1, email= email_1, country =country_1 
 where id = id_1;
 END //
 DELIMITER 
 CALL edit_user(id_1, name_1,email_1, country_1);
 
 DELIMITER //
 CREATE PROCEDURE delete_user(in id_1 INT)
 DELETE FROM users WHERE id =id_1;
  END //
 DELIMITER 
 CALL delete_user(id_1);
 