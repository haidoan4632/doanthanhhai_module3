use library;
-- thống kê các đầu sách được mượn nhiều nhất
CREATE VIEW so_2 as
SELECT COUNT(id_books) as so_lan_su_dung FROM books JOIN borrows
ON books.id = borrows.id_books
GROUP BY id_books;

SELECT books.title, COUNT(id_books) as so_lan_su_dung FROM books JOIN borrows
ON books.id = borrows.id_books
GROUP BY id_books
HAVING so_lan_su_dung=(SELECT max(so_lan_su_dung) FROM so_2)
ORDER BY so_lan_su_dung DESC;

-- thống kê các đầu sách chưa được mượn
select books.title,books.id
from books
 join borrows on books.id=borrows.id_books 
where books.id not in (select borrows.id_books from borrows);

-- lấy ra danh sách các học viên đã từng mượn sách và sắp xếp theo số lượng mượn sách từ lớn đến nhỏ
SELECT students.name, COUNT(borrows.id_students) FROM students JOIN borrows
ON students.id = borrows.id_students
GROUP BY students.id
ORDER BY count(borrows.id_students) DESC;

-- lấy ra các học viên mượn sách nhiều nhất của thư viện
SELECT students.name FROM students JOIN borrows
ON students.id = borrows.id_students
GROUP BY students.id
HAVING COUNT(borrows.id_students) =
(SELECT COUNT(borrows.id_students) FROM students JOIN borrows
ON students.id = borrows.id_students
GROUP BY students.id
ORDER BY count(borrows.id_students) DESC
LIMIT 1);


-- tạo index, view, stored procedure----

-- tạo index cho cột title của bảng books--
  CREATE INDEX index_name ON books(title);

-- Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn--							 
CREATE VIEW view_borrow_book as
SELECT books.title,count(borrows.id_books) as so_lan_duoc_muon FROM borrows JOIN books
ON borrows.id_books = books.id
GROUP BY books.id;

-- Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN--
DELIMITER //
CREATE PROCEDURE add_book(IN id INT,IN title VARCHAR(45), IN page_size INT, IN id_category INT, IN id_authors INT)
BEGIN
INSERT INTO books VALUES
(id,title,page_size,id_category,id_authors);
END //
DELIMITER ;
					