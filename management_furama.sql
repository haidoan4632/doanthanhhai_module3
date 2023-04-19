-- drop database if exists furama_management;
CREATE DATABASE furama_management;
USE furama_management;
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45) NOT NULL
);
 
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45) NOT NULL
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45) NOT NULL
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL, 
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) UNIQUE,
    luong DOUBLE,
    so_dien_thoaii VARCHAR(45),
    email VARCHAR(45) UNIQUE,
    dia_chi VARCHAR(45) NOT NULL,
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45) UNIQUE
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ma_loai_khach INT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) UNIQUE,
    so_dien_thoai VARCHAR(45) UNIQUE,
    email VARCHAR(45) UNIQUE,
    dia_chi VARCHAR(45) UNIQUE,
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
);

-- chú thích: thay đổi vị trí ma_loai_khach trong bảng
-- alter table khach_hang modify column ma_loai_khach int after dia_chi;


CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45) NOT NULL
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45) UNIQUE,
    dien_tich INT NOT NULL,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT NOT NULL,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45) UNIQUE,
    mo_ta_tien_nghi_khac VARCHAR(45) UNIQUE,
    dien_tich_ho_boi DOUBLE UNIQUE,
    so_tang INT NOT NULL,
    dich_vu_mien_phi_di_kem TEXT,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

-- chú thích: thay đổi vị trí ten_dich_vu trong bảng
-- alter table dich_vu modify column ma_kieu_thue int after dich_vu_mien_phi_di_kem;
-- alter table dich_vu modify column ma_loai_dich_vu int after ma_kieu_thue;

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

-- chú thích: thay đổi vị trí hop_dong_chi_tiet trong bảng
-- alter table hop_dong_chi_tiet modify column ma_hop_dong int after so_luong ;
-- alter table hop_dong_chi_tiet modify column ma_dich_vu_di_kem int after ma_hop_dong;

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45) NOT NULL
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);

-- task2 đến task 5:
USE furama_management;

-- task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT 
    *
FROM
    nhan_vien
WHERE
    (ho_ten LIKE '% h%' OR ho_ten LIKE '% t%'
        OR ho_ten LIKE '% k%')
        AND LENGTH(ho_ten) <= 25;
  
  
-- task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * FROM khach_hang
WHERE
(TIMESTAMPDIFF(YEAR, ngay_sinh, NOW()) BETWEEN 18 AND 50)
AND (dia_chi LIKE '%Đà Nẳng%'
OR dia_chi LIKE '%Quảng trị%');
        

-- chú thích: TIMESTAMPDIFF trong SQL là hàm dùng để tính số lượng giá trị khoảng cách thời gian (days, hours, minutes, seconds,...) 
-- giữa hai giá trị ngày cho trước.


-- task 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT k.ma_khach_hang, k.ho_ten, COUNT(h.ma_hop_dong) AS so_lan_dat_phong FROM khach_hang k
INNER JOIN hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
INNER JOIN loai_khach l ON l.ma_loai_khach = k.ma_loai_khach
WHERE ten_loai_khach = 'Diamond'
GROUP BY h.ma_khach_hang
ORDER BY so_lan_dat_phong;

-- task 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT k.ma_khach_hang, k.ho_ten, l.ten_loai_khach, h.ma_hop_dong, d.ten_dich_vu, h.ngay_lam_hop_dong, h.ngay_ket_thuc, (ifnull(d.chi_phi_thue,0) + sum(ifnull(hd.so_luong,0) * ifnull(dv.gia,0))) as tong_tien
FROM khach_hang k 
LEFT JOIN hop_dong h ON k.ma_khach_hang = h.ma_khach_hang 
LEFT JOIN loai_khach l ON l.ma_loai_khach = k.ma_loai_khach
LEFT JOIN hop_dong_chi_tiet hd ON hd.ma_hop_dong = h.ma_hop_dong
LEFT JOIN dich_vu d ON d.ma_dich_vu = h.ma_dich_vu 
LEFT JOIN dich_vu_di_kem dv ON dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem 
GROUP BY h.ma_hop_dong, k.ma_khach_hang;

-- task 6 đến task 10

-- task 6: Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của 
-- tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
FROM dich_vu 
INNER JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
INNER JOIN hop_dong  ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
WHERE dich_vu.ma_dich_vu NOT IN (SELECT ma_dich_vu FROM hop_dong
WHERE year(hop_dong.ngay_lam_hop_dong) = 2021
AND (month(hop_dong.ngay_lam_hop_dong) BETWEEN 1 AND 3))
GROUP BY ma_dich_vu ;


-- task 7:	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng
-- chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
LEFT JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE dv.ma_dich_vu IN (SELECT ma_dich_vu FROM hop_dong WHERE year(hd.ngay_lam_hop_dong) = 2020) 
AND (dv.ma_dich_vu NOT IN (SELECT ma_dich_vu FROM hop_dong where year(hd.ngay_lam_hop_dong) = 2021))
GROUP BY dv.ma_dich_vu;

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where dv.ma_dich_vu in (select ma_dich_vu from hop_dong where year(hd.ngay_lam_hop_dong) = 2020)
and dv.ma_dich_vu not in (select ma_dich_vu from hop_dong where year (hd.ngay_lam_hop_dong) = 2021)
GROUP BY dv.ma_dich_vu;
-- task 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- cách 1:
SELECT ho_ten 
FROM khach_hang
GROUP BY ho_ten;

-- cách 2:
SELECT DISTINCT ho_ten 
FROM khach_hang;

-- cách 3: 
SELECT ho_ten FROM khach_hang
UNION
SELECT ho_ten FROM khach_hang

-- task 9: 	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT COUNT(ma_khach_hang) AS so_luong_khach_dat_phong, MONTH(ngay_lam_hop_dong) AS thang
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;


-- task 10: Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem
FROM hop_dong hd
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;

-- task 11:	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT dv.ma_dich_vu_di_kem, dv.ten_dich_vu_di_kem, dv.gia, dv.don_vi, dv.trang_thai FROM dich_vu_di_kem dv
JOIN hop_dong_chi_tiet hdct ON dv.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN khach_hang kh ON kh.ma_khach_hang =  hd.ma_khach_hang
JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE lk.ten_loai_khach = "Diamond" AND (kh.dia_chi LIKE '%Vinh%' OR  kh.dia_chi LIKE '%Quảng Ngãi%');

-- task 12:	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT hd.ma_hop_dong, nv.ho_ten as ho_ten_nhan_vien , kh.ho_ten as ho_ten_khach_hang, kh.so_dien_thoai as so_dien_thoai_khach_hang,dv.ten_dich_vu, SUM(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem,hd.tien_dat_coc
FROM hop_dong_chi_tiet hdct
RIGHT JOIN hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
JOIN nhan_vien nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
JOIN khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang 
JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE YEAR(hd.ngay_lam_hop_dong) = 2020 AND(MONTH(hd.ngay_lam_hop_dong)BETWEEN 10 AND 12) 
AND hd.ngay_lam_hop_dong NOT IN (SELECT ngay_lam_hop_dong FROM hop_dong WHERE year(hd.ngay_lam_hop_dong) = 2021 AND (MONTH(hd.ngay_lam_hop_dong) BETWEEN 1 AND 6))
GROUP BY hd.ma_hop_dong;


-- task 12 bị mất đi 1 khách hàng tên dương văn quan (đã fixed ở dòng 267)


-- task 13:	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).


SELECT dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem, SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM dich_vu_di_kem  dvdk
JOIN hop_dong_chi_tiet  hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem = (
SELECT SUM(hdct.so_luong)  tong_so_luong
FROM dich_vu_di_kem  dvdk
JOIN hop_dong_chi_tiet  hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
ORDER BY tong_so_luong DESC LIMIT 1
);



-- task 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hdct.ma_hop_dong,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem, count(ifnull(dvdk.ma_dich_vu_di_kem,0)) as so_lan_su_dung from dich_vu_di_kem as dvdk
JOIN hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
JOIN hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
group by hdct.ma_dich_vu_di_kem,hd.ma_hop_dong
HAVING so_lan_su_dung = 1;



SELECT hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
FROM hop_dong hd
JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
RIGHT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
JOIN loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem,hd.ma_hop_dong
HAVING so_lan_su_dung = 1;

-- task 15: Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoaii,nv.dia_chi from nhan_vien as nv
JOIN trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
GROUP BY nv.ma_nhan_vien
having count(ngay_lam_hop_dong) <=3;


SELECT nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoaii, nv.dia_chi
FROM hop_dong hd
JOIN nhan_vien nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
JOIN trinh_do td ON td.ma_trinh_do = nv.ma_trinh_do
JOIN bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
GROUP BY hd.ma_nhan_vien
HAVING COUNT(hd.ma_nhan_vien) <= 3;

-- task 16:Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

SET SQL_SAFE_UPDATES = 0;
DELETE FROM nhan_vien
WHERE nhan_vien.ma_nhan_vien NOT IN (
SELECT ma_nhan_vien FROM hop_dong 
WHERE year(ngay_lam_hop_dong) BETWEEN 2019 AND 2021
GROUP BY hop_dong.ma_nhan_vien);
SET SQL_SAFE_UPDATES = 1;

rollback; 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM nhan_vien;
SET SQL_SAFE_UPDATES = 1;

-- task 17:	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
CREATE view task_17 as 
SELECT kh.ma_khach_hang, kh.ho_ten, kh.ngay_sinh, kh.gioi_tinh, kh.so_cmnd, kh.so_dien_thoai,kh.email,kh.dia_chi,lk.ten_loai_khach,lk.ma_loai_khach,
 year(hd.ngay_ket_thuc) as nam_thanh_toan_tien, sum((hdct.so_luong)*(dvdk.gia) + dv.chi_phi_thue ) as tien_thanh_toan  
FROM khach_hang as kh
LEFT JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach 
LEFT JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
GROUP BY  kh.ma_khach_hang,hd.ma_hop_dong
HAVING lk.ten_loai_khach = 'Platinium' 
AND nam_thanh_toan_tien = 2021
AND tien_thanh_toan >= 1000000;




SELECT * FROM task_17;
UPDATE loai_khach SET ten_loai_khach = 'Diamond'
WHERE loai_khach.ma_loai_khach IN (SELECT ma_loai_khach FROM task_17);


-- cần hợp đồng, loại khách, hợp đồng chi tiết, dịch vụ đi kèm, nhóm lại theo ma_hop_dong và ma_khach_hang
-- thực hiện lệnh update: 

-- task 18: Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

CREATE VIEW task_18 as
SELECT kh.ma_khach_hang,kh.ho_ten,hd.ngay_lam_hop_dong,hd.ma_hop_dong, year(hd.ngay_lam_hop_dong) as nam_lam_hop_dong FROM khach_hang kh
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
GROUP BY hd.ma_hop_dong
HAVING nam_lam_hop_dong <2021;

SELECT * FROM task_18;
set foreign_key_checks=0;
DELETE FROM khach_hang kh WHERE kh.ma_khach_hang IN (SELECT ma_khach_hang FROM task_18);
set foreign_key_checks=1;



-- task 19:	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
SET SQL_SAFE_UPDATES = 1;
UPDATE dich_vu_di_kem
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN
(SELECT ma_dich_vu_di_kem FROM hop_dong_chi_tiet hdct
JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE year(hd.ngay_lam_hop_dong) = 2020
GROUP BY hdct.ma_dich_vu_di_kem
HAVING sum(hdct.so_luong) > 10);


-- task 20: Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT nv.ma_nhan_vien as id, nv.ho_ten,nv.email,nv.so_dien_thoaii,nv.ngay_sinh,nv.dia_chi
FROM nhan_vien nv 
UNION ALL
SELECT kh.ma_khach_hang as id,kh.ho_ten,kh.email, kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi 
FROM khach_hang kh
