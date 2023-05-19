CREATE DATABASE library;
USE library;
CREATE TABLE students(
id INT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
birthday VARCHAR(45) NOT NULL,
class_name VARCHAR(45) NOT NULL
);

CREATE TABLE borrows(
id INT PRIMARY KEY,
id_students INT NOT NULL,
id_books INT NOT NULL,
borrow_date VARCHAR(45) NOT NULL,
return_date VARCHAR(45) NOT NULL,
FOREIGN KEY(id_students) REFERENCES students(id),
FOREIGN KEY(id_books) REFERENCES books(id)
);


CREATE TABLE books (
id INT PRIMARY KEY,
title VARCHAR(45) NOT NULL,
page_size VARCHAR(45) NOT NULL,
id_category INT NOT NULL,
id_authors INT NOT NULL,
FOREIGN KEY(id_category) REFERENCES category(id),
FOREIGN KEY(id_authors) REFERENCES authors(id)
);


CREATE TABLE category(
id INT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL
);

CREATE TABLE authors(
id INT PRIMARY KEY,
name VARCHAR(45) NOT NULL
);


