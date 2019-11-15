create database dbminishop character set utf8 collate utf8_general_ci;
use dbminishop;
create table CHUCVU(
	MACHUCVU INTEGER AUTO_INCREMENT,
    TENCHUCVU NVARCHAR(50),
    PRIMARY KEY(MACHUCVU)
);
CREATE TABLE NHANVIEN(
	MANHANVIEN INTEGER AUTO_INCREMENT,
    HOTEN NVARCHAR(50),
    DIACHI NVARCHAR(100),
    GIOITINH nvarchar(50),
    CMND NVARCHAR(20),
    SODT VARCHAR(12),
    MACHUCVU INTEGER,
    EMAIL VARCHAR(50),
    TENDANGNHAP VARCHAR(50),
    MATKHAU VARCHAR(50),
    PRIMARY KEY(MANHANVIEN),
    CONSTRAINT FK_CHUCVU FOREIGN KEY(MACHUCVU) REFERENCES CHUCVU(MACHUCVU)

);
CREATE TABLE DANHMUCSANPHAM(
	MADANHMUC INTEGER AUTO_INCREMENT,
    TENDANHMUC NVARCHAR(100),
    HINHDANHMUC TEXT,
    PRIMARY KEY(MADANHMUC)

);
CREATE TABLE SANPHAM(
	MASANPHAM INTEGER AUTO_INCREMENT,
    MADANHMUC INTEGER,
    TENSANPHAM NVARCHAR(100),
    GIATIEN VARCHAR(50),
    MOTA TEXT,
    HINHSANPHAM TEXT,
    PRIMARY KEY(MASANPHAM),
    CONSTRAINT FK_SANPHAM_DANHMUC FOREIGN KEY (MADANHMUC) REFERENCES DANHMUCSANPHAM(MADANHMUC)
);
CREATE TABLE MAUSANPHAM(
	 MAMAU INTEGER AUTO_INCREMENT,
     TENMAU NVARCHAR(50),
     PRIMARY KEY(MAMAU)
);
CREATE TABLE SIZESANPHAM(
MASIZE INTEGER AUTO_INCREMENT,
SIZE NVARCHAR(20),
PRIMARY KEY(MASIZE)
);
CREATE TABLE CHITIETSANPHAM(
MACHITIETSANPHAM INTEGER AUTO_INCREMENT,
MASANPHAM INTEGER,
MASIZE INTEGER,
MAMAU INTEGER,
SOLUONG INTEGER,
NGAYNHAP NVARCHAR(50),
PRIMARY KEY(MACHITIETSANPHAM),
CONSTRAINT FK_CHITET_SANPHAM FOREIGN KEY (MASANPHAM) REFERENCES SANPHAM(MASANPHAM),
CONSTRAINT FK_CHITIET_SIZE FOREIGN KEY(MASIZE) REFERENCES SIZESANPHAM(MASIZE),
CONSTRAINT FK_CHITIET_MAU FOREIGN KEY(MAMAU) REFERENCES MAUSANPHAM(MAMAU)

);
CREATE TABLE KHUYENMAI(
MAKHUYENMAI INTEGER AUTO_INCREMENT,
TENKHUYENMAI NVARCHAR(200),
THOIGIANBATDAU NVARCHAR(50),
THOIGIANKETTHUC NVARCHAR(50),
MOTA TEXT,
HINHKHUYENMAI TEXT,
GIAGIAM INTEGER,
PRIMARY KEY(MAKHUYENMAI)
);
CREATE TABLE CHITIETKHUYENMAI(
MAKHUYENMAI INTEGER,
MASANPHAM INTEGER,

PRIMARY KEY(MAKHUYENMAI,MASANPHAM),
CONSTRAINT FK_CTKM FOREIGN KEY(MASANPHAM) REFERENCES SANPHAM(MASANPHAM),
CONSTRAINT FK_CTKM1 FOREIGN KEY(MAKHUYENMAI)REFERENCES KHUYENMAI(MAKHUYENMAI)
);
CREATE TABLE HOADON(
MAHOADON INTEGER AUTO_INCREMENT,
TENKHACHHANG NVARCHAR(100),
SODT CHAR(12),
DIACHIGIAOHANG NVARCHAR(200),
TINHTRANG bit,
NGAYLAP VARCHAR(50),
PRIMARY KEY(MAHOADON)
);
CREATE TABLE CHITIETHOADON(
 MAHOADON INTEGER,
 MACHITIETSANPHAM integer,
 SOLUONG integer,
 GIATIEN VARCHAR(100),
 PRIMARY KEY(MAHOADON,MACHITIETSANPHAM),
 CONSTRAINT FK_CTHD FOREIGN KEY (MAHOADON) REFERENCES HOADON(MAHOADON),
 CONSTRAINT FK_CTSP FOREIGN KEY (MACHITIETSANPHAM) REFERENCES CHITIETSANPHAM(MACHITIETSANPHAM)
);