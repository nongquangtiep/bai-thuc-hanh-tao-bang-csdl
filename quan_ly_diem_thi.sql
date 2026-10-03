-- 1. Tạo và chọn database
CREATE DATABASE IF NOT EXISTS QuanLyDiemThi;
USE QuanLyDiemThi;

-- 2. Tạo bảng HocSinh
CREATE TABLE HocSinh (
    MaHS VARCHAR(20) PRIMARY KEY,
    TenHS VARCHAR(50),
    NgaySinh DATETIME,
    Lop VARCHAR(20),
    GT VARCHAR(20)
);

-- 3. Tạo bảng GiaoVien
CREATE TABLE GiaoVien (
    MaGV VARCHAR(20) PRIMARY KEY,
    TenGV VARCHAR(50),
    SDT VARCHAR(10)
);

-- 4. Tạo bảng MonHoc
CREATE TABLE MonHoc (
    MaMH VARCHAR(50) PRIMARY KEY,
    TenMH VARCHAR(50),
    MaGV VARCHAR(20)
);

-- Bổ sung khóa ngoại cho MonHoc tham chiếu GiaoVien
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);

-- 5. Tạo bảng BangDiem
CREATE TABLE BangDiem (
    MaHS VARCHAR(20),
    MaMH VARCHAR(50),
    DiemThi INT,
    NgayKT DATETIME,
    PRIMARY KEY (MaHS, MaMH),
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);