create database ss1_building_database_student;

use ss1_building_database_student;

create table class1 (
id int primary key auto_increment,
name varchar(45) not null
);

create table teacher (
id int primary key auto_increment,
name varchar(45) not null,
age int,
country varchar(45) not null
);