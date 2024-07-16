-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 13, 2024 lúc 04:56 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phim`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phim`
--

CREATE TABLE `phim` (
  `id` int(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price` int(6) NOT NULL DEFAULT 0,
  `view` int(6) NOT NULL DEFAULT 100,
  `trailer` varchar(20) DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `idcate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phim`
--

INSERT INTO `phim` (`id`, `name`, `img`, `price`, `view`, `trailer`, `mota`, `idcate`) VALUES
(1, 'Chị chị em em', 'chichiemem2.webp', 0, 300, NULL, NULL, 2),
(2, 'Con nhót mót chồng', 'connhot.webp', 0, 400, NULL, NULL, 2),
(3, 'Đất rừng phương nam', 'datrung.webp', 0, 700, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phim_thuoc_the_loai`
--

CREATE TABLE `phim_thuoc_the_loai` (
  `id` int(6) NOT NULL,
  `idloai` int(6) NOT NULL,
  `idphim` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

CREATE TABLE `theloai` (
  `id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`id`, `name`, `description`, `status`) VALUES
(1, 'Hành động', NULL, 0),
(2, 'Tình cảm', NULL, 0),
(3, 'Hài hước', NULL, 0),
(4, 'Viễn tưởng', NULL, 0),
(6, 'Thần thoại', NULL, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `phim`
--
ALTER TABLE `phim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_phim_loai` (`idcate`);

--
-- Chỉ mục cho bảng `phim_thuoc_the_loai`
--
ALTER TABLE `phim_thuoc_the_loai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_phim_ttl_phim` (`idphim`),
  ADD KEY `fk_phim_ttl_loai` (`idloai`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `phim`
--
ALTER TABLE `phim`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `phim_thuoc_the_loai`
--
ALTER TABLE `phim_thuoc_the_loai`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `theloai`
--
ALTER TABLE `theloai`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `phim`
--
ALTER TABLE `phim`
  ADD CONSTRAINT `fk_phim_loai` FOREIGN KEY (`idcate`) REFERENCES `theloai` (`id`);

--
-- Các ràng buộc cho bảng `phim_thuoc_the_loai`
--
ALTER TABLE `phim_thuoc_the_loai`
  ADD CONSTRAINT `fk_phim_ttl_loai` FOREIGN KEY (`idloai`) REFERENCES `theloai` (`id`),
  ADD CONSTRAINT `fk_phim_ttl_phim` FOREIGN KEY (`idphim`) REFERENCES `phim` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
