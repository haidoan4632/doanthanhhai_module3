-- drop database if exists convert_erd_to_relational_model;
CREATE DATABASE convert_erd_to_relational_model;
USE convert_erd_to_relational_model;
CREATE TABLE nha_cung_cap(
ma_nha_cung_cap INT PRIMARY KEY,
ten_nha_cung_cap VARCHAR(45),
dia_chi VARCHAR(45)
);

CREATE TABLE don_dat_hang(
so_don_hang INT PRIMARY KEY,
ngay_dat_hang DATE,
ma_nha_cung_cap INT,
FOREIGN KEY(ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap)
);

CREATE TABLE phieu_xuat (
so_phieu_xuat INT PRIMARY KEY,
ngay_xuat DATE
);

CREATE TABLE vat_tu (
ma_vat_tu INT PRIMARY KEY,
ten_vat_tu VARCHAR(45)
);

CREATE TABLE phieuxuat_vattu(
so_phieu_xuat INT,
ma_vat_tu INT,
don_gia_xuat INT,
so_luong_xuat INT,
PRIMARY KEY (so_phieu_xuat,ma_vat_tu),
FOREIGN KEY (so_phieu_xuat) REFERENCES phieu_xuat(so_phieu_xuat),
FOREIGN KEY (ma_vat_tu) REFERENCES  vat_tu(ma_vat_tu)
);

CREATE TABLE dondathang_vattu(
so_don_hang INT,
ma_vat_tu INT,
PRIMARY KEY (so_don_hang,ma_vat_tu),
FOREIGN KEY (so_don_hang) REFERENCES don_dat_hang(so_don_hang),
FOREIGN KEY (ma_vat_tu) REFERENCES  vat_tu(ma_vat_tu)
);

CREATE TABLE phieu_nhap(
so_phieu_nhap INT PRIMARY KEY,
ngay_nhap DATE
);

CREATE TABLE so_dien_thoai(
id INT PRIMARY KEY AUTO_INCREMENT,
so_dien_thoai VARCHAR(15),
number_id int,
FOREIGN KEY(number_id) REFERENCES nha_cung_cap(ma_nha_cung_cap)
);

CREATE TABLE phieunhap_vattu(
so_phieu_nhap INT,
ma_vat_tu INT,
don_gia_nhap INT,
so_luong_nhap INT,
PRIMARY KEY (so_phieu_nhap,ma_vat_tu),
FOREIGN KEY (so_phieu_nhap) REFERENCES phieu_nhap(so_phieu_nhap),
FOREIGN KEY (ma_vat_tu) REFERENCES  vat_tu(ma_vat_tu)
);

