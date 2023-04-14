-- drop database if exists quan_ly_sinh_vien;
CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
CREATE TABLE classes
(
    classid   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    className VARCHAR(60) NOT NULL,
    startdate DATETIME    NOT NULL,
    status    BIT
);
CREATE TABLE student
(
    studentid   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    studentmame VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    Status      BIT,
    classid     INT NOT NULL,
    FOREIGN KEY (classid) REFERENCES classes (classid)
);
CREATE TABLE subject
(
    subid   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subname VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    status  BIT                  DEFAULT 1
);
CREATE TABLE mark
(
    markid    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subid     INT NOT NULL,
    studentid INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    examtimes TINYINT DEFAULT 1,
    UNIQUE (subid, studentid),
    FOREIGN KEY (subid) REFERENCES subject (subid),
    FOREIGN KEY (studentid) REFERENCES student (studentid)
);
INSERT INTO classes
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO classes
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO classes
VALUES (3, 'B3', current_date, 0);

INSERT INTO student ( studentmame, address, phone, status, classId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student ( studentmame, address, status, classId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student ( studentmame, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (subid, studentid, mark, examtimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);


USE quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM subject
 WHERE credit = (SELECT MAX(credit) FROM subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select subject.subid, subject.subname, subject.credit, subject.status, mark.mark from subject
inner join mark on mark.subid = subject.subid
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
  
SELECT student.studentid,student.studentmame, AVG(mark) as avg_mark FROM student 
 join  mark on mark.studentid = student.studentid
GROUP BY studentid
order by avg_mark desc;

