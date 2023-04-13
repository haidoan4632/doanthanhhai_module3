-- drop database if exists QuanLySinhVien;
CREATE DATABASE quanlysinhvien;
USE quanlysinhvien;
CREATE TABLE classes
(
    classid   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    classname VARCHAR(60) NOT NULL,
    startdate DATETIME NOT NULL,
    status    BIT
);
CREATE TABLE student
(
    studentid   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    studentname VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    status      BIT,
    classid     INT NOT NULL,
    FOREIGN KEY (classid) REFERENCES classes (classid)
);
CREATE TABLE subject
(
    subid   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subName VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT         DEFAULT 1
);
CREATE TABLE mark
(
    markid    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subid     INT NOT NULL,
    studentid INT NOT NULL,
    nark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    examtimes TINYINT DEFAULT 1,
    UNIQUE (subid, studentid),
    FOREIGN KEY (subid) REFERENCES subject (subid),
    FOREIGN KEY (studentid) REFERENCES student (studentId)
);
INSERT INTO classes
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO classes
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO classes
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (studentName, address, phone, status, clasid)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (studentname, address, status, classid)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (studentname, address, phone, status, classid)
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
-- hiển thị tất cả sinh viên có tên bắt đầu bằng ký tự 'h'
USE quanlysinhvien;     
SELECT * FROM student WHERE studentname LIKE "h%" ;
-- hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT * FROM class WHERE month(startdate)=12 ;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT * FROM subject WHERE credit >=3 AND credit <=5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
UPDATE student SET classid = 2 WHERE studentname = "Hung";
SET SQL_SAFE_UPDATES = 1;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT student.studentname,subject.subname,mark.mark FROM student 
INNER JOIN mark ON student.studentid = mark.studentid
INNER JOIN subject ON mark.subid = subject.subid
ORDER BY mark desc;

