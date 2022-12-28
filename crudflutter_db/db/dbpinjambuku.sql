-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2022 at 06:03 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpinjambuku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjam`
--

CREATE TABLE `tb_peminjam` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nim` varchar(25) NOT NULL,
  `judul_buku` varchar(25) NOT NULL,
  `tgl_pinjam` varchar(25) NOT NULL,
  `tgl_kembalikan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_peminjam`
--

INSERT INTO `tb_peminjam` (`id`, `nama`, `nim`, `judul_buku`, `tgl_pinjam`, `tgl_kembalikan`) VALUES
(1, 'Dwi Bagia S', '1207050030', 'Brief History of Time', '22-6-2022', '1-7-2022'),
(2, 'Maulana', '123442515', 'Test', '7-6-2022', '14-6-2022'),
(4, 'Maulana A', '123124124', 'What is Life?', '14-6-2022', '21-6-2022'),
(11, 'Maulana H', '1241', 'sdd', 'qwrq', '2dqw');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_peminjam`
--
ALTER TABLE `tb_peminjam`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_peminjam`
--
ALTER TABLE `tb_peminjam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
