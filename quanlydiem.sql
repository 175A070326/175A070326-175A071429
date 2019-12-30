-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 30, 2019 lúc 06:30 PM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlydiem`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem`
--

CREATE TABLE `diem` (
  `mamon` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `masv` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `diemqt` float NOT NULL,
  `diemthi` float NOT NULL,
  `diemtk` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `magv` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `diachi` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hocky`
--

CREATE TABLE `hocky` (
  `mahk` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tenhk` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `namhoc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `makhoa` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tenkhoa` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

CREATE TABLE `lop` (
  `malop` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `magv` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tenlop` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon`
--

CREATE TABLE `mon` (
  `mamon` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mahk` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tenmon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sotinchi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `masv` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `malop` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `makhoa` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gioitinh` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `diachi` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `tentk` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `matkhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `diem`
--
ALTER TABLE `diem`
  ADD KEY `FK_mon` (`mamon`),
  ADD KEY `FK_sinhvien` (`masv`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`magv`);

--
-- Chỉ mục cho bảng `hocky`
--
ALTER TABLE `hocky`
  ADD PRIMARY KEY (`mahk`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`makhoa`);

--
-- Chỉ mục cho bảng `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`malop`),
  ADD KEY `FK_giangvien` (`magv`);

--
-- Chỉ mục cho bảng `mon`
--
ALTER TABLE `mon`
  ADD PRIMARY KEY (`mamon`),
  ADD KEY `FK_hocky` (`mahk`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`masv`),
  ADD KEY `FK_lop` (`malop`),
  ADD KEY `FK_khoa` (`makhoa`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `diem`
--
ALTER TABLE `diem`
  ADD CONSTRAINT `FK_mon` FOREIGN KEY (`mamon`) REFERENCES `mon` (`mamon`),
  ADD CONSTRAINT `FK_sinhvien` FOREIGN KEY (`masv`) REFERENCES `sinhvien` (`masv`);

--
-- Các ràng buộc cho bảng `lop`
--
ALTER TABLE `lop`
  ADD CONSTRAINT `FK_giangvien` FOREIGN KEY (`magv`) REFERENCES `giangvien` (`magv`);

--
-- Các ràng buộc cho bảng `mon`
--
ALTER TABLE `mon`
  ADD CONSTRAINT `FK_hocky` FOREIGN KEY (`mahk`) REFERENCES `hocky` (`mahk`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `FK_khoa` FOREIGN KEY (`makhoa`) REFERENCES `khoa` (`makhoa`),
  ADD CONSTRAINT `FK_lop` FOREIGN KEY (`malop`) REFERENCES `lop` (`malop`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
