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
SELECT 
    *
FROM
    khach_hang
WHERE
    (TIMESTAMPDIFF(YEAR, ngay_sinh, NOW()) BETWEEN 18 AND 50)
        AND (dia_chi LIKE '%Đà Nẳng%'
        OR dia_chi LIKE '%Quảng trị%');
        
-- chú thích: TIMESTAMPDIFF trong SQL là hàm dùng để tính số lượng giá trị khoảng cách thời gian (days, hours, minutes, seconds,...) 
-- giữa hai giá trị ngày cho trước.


-- task 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT 
    k.ma_khach_hang,
    k.ho_ten,
    COUNT(h.ma_hop_dong) AS so_lan_dat_phong
FROM
    khach_hang k
        INNER JOIN
    hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
        INNER JOIN
    loai_khach l ON l.ma_loai_khach = k.ma_loai_khach
WHERE
    ten_loai_khach = 'Diamond'
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



-- task 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- cách 1:
SELECT ho_ten 
FROM khach_hang
GROUP BY ho_ten;
-- cách 2:
SELECT DISTINCT ho_ten 
FROM khach_hang;

-- cách 3: 
SELECT ho_ten 
FROM khach_hang
UNION
SELECT ho_ten 
FROM khach_hang

-- task 9: 	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT COUNT(ma_khach_hang) AS so_luong_khach_dat_phong, MONTH(ngay_lam_hop_dong) AS thang
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;