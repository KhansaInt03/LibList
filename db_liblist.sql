-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2022 at 04:22 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_liblist`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `id_anggota` varchar(6) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_anggota`
--

INSERT INTO `tb_anggota` (`id_anggota`, `nama_anggota`, `alamat`, `no_hp`) VALUES
('A00001', 'Abraham Somad', 'Jl Panjaitan', '+6283126354081'),
('A00002', 'Arjun Wiraga', 'Perumahan Palagan No.10', '+62852280619'),
('A00003', 'Budi Anjayani', 'Perumahan Nasional B.43', '+628345968321'),
('A00004', 'Rahmad Abdullah', 'Jl Tentara Pelajar', '+6283674099987'),
('A00005', 'Nana Wahyu', 'Dusun Penjajaran Rt7 Rw12', '+6283522666734'),
('A00006', 'Jajar Sunandar', 'Perumahan Palagan No.12', '+628347568912'),
('A00007', 'Rima Widya', 'Dusun Pancaroba', '+6281234556901'),
('A00008', 'Bunga Amarilis', 'Perumahan Indah C.12', '+6281347850987'),
('A00009', 'Icha Wahyuni', 'Dusun Pangabean', '+6281345670987'),
('A00010', 'Putri Susangku', 'Dusun Majalengka', '+6281234567213'),
('A00011', 'Bayu Ario', 'Perumahan Majalengka No.56', '+628514356216'),
('A00012', 'Cahyo Purnomo', 'Perumahan Majalengka No.50', '+628514354321'),
('A00013', 'Sasongko Jati', 'Perumahan Indah D.44', '+6281234555901'),
('A00014', 'Bayu Jati', 'Dusun Pangandaran', '+6281234555412'),
('A00015', 'Rama Arjuna', 'Perumahan Majalengka E.32', '+6281221340876'),
('A00016', 'Sinta Prayoga', 'Perumahan Majalengka E.32', '+6281221340877'),
('A00017', 'Rahmat Irawan', 'Jl Madya', '+6281383036789');

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` varchar(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `genre` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL,
  `stok` int(3) NOT NULL,
  `tersedia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul`, `genre`, `author`, `stok`, `tersedia`) VALUES
('B0001', 'Kisah Epik Sukarno', 'Biografi', 'Abraham Panumbangan', 5, 5),
('B0002', 'Mohammad Hatta Hidup Jujur dan Sederhana untuk Ind', 'Biografi', 'Anom Whani Wicaksana', 7, 7),
('B0003', 'Mohammad Hatta:Biografi Singkat 1902-1980', 'Biografi', 'Salman Alfarizi', 7, 7),
('B0004', 'K.H. Ahmad Dahlan: Biografi Singkat 1868-1923', 'Biografi', 'Adi Nugroho', 5, 4),
('E0001', 'Ensiklopedi Geografi, Mengenal 33 Provinsi', 'Ensiklopedia', 'Dr. Ir. Imam Santoso, M.Sc ', 3, 3),
('E0003', 'Ensiklopedi Negara-Negara Dunia', 'Ensiklopedia', 'Amir F. Hidayat', 2, 2),
('E0004', 'Ensiklopedi Americana', 'Ensiklopedia', 'Pumps to Russel', 2, 2),
('K0001', 'Jujutsu Kaisen Vol.1', 'Komik', 'Akutami Gege', 5, 5),
('K0002', 'Naruto Vol 12', 'Komik', 'Masashi Kishimoto', 5, 5),
('K0003', 'Attack on Titan Vol.4', 'Komik', 'Hajime Isayama', 6, 8),
('K0004', 'Banana Fish', 'Komik', 'Yoshida Akimi', 6, 6),
('K0005', 'Detective Conan Vol.4', 'Komik', 'Aoyama Gosho', 10, 7),
('K0006', 'Death Note Vol.2', 'Komik', 'Tsugumi Ohba', 12, 11),
('K0007', 'Naruto Shipuden Vol.12', 'Komik', 'Masashi Kishimoto', 3, 3),
('K0008', 'Naruto Shipuden Vol.10', 'Komik', 'Masashi Kishimoto', 3, 3),
('K0009', 'Banana Fish Vol.2', 'Komik', 'Yoshida Akimi', 5, 5),
('N0001', 'Bumi', 'Novel', 'Tere Liye', 5, 5),
('N0002', 'Bulan', 'Novel', 'Tere Liye', 4, 4),
('N0003', 'Hujan', 'Novel', 'Tere Liye', 4, 4),
('N0004', 'Rindu', 'Novel', 'Tere Liye', 5, 5),
('N0005', 'Negeri Para Bedebah', 'Novel', 'Tere Liye', 3, 3),
('N0006', 'Daun yang Jatuh Tidak Membenci Angin', 'Novel', 'Tere Liye', 5, 5),
('N0007', 'Rembulan Tenggelam di Wajahmu', 'Novel', 'Tere Liye', 5, 5),
('N0008', 'Negeri di Ujung Tanduk', 'Novel', 'Tere Liye', 6, 6),
('N0009', 'Hafalan Solat Delisa', 'Novel', 'Tere Liye', 3, 3),
('N0010', 'Kau Aku dan Sepucuk Angpao Merah', 'Novel', 'Tere Liye', 5, 5),
('N0011', 'Si Anak Spesial', 'Novel', 'Tere Liye', 3, 3),
('N0012', 'Bidadari-Bidadari Surga', 'Novel', 'Tere Liye', 4, 4),
('N0013', 'The Cold Moon', 'Novel', 'Jeffery Deaver', 5, 5),
('N0014', 'Laskar Pelangi', 'Novel', 'Andrea Hirata', 2, 2),
('N0015', 'Sunshine Becomes You', 'Novel', 'Ilana Tan', 3, 3),
('N0016', 'Winter in Tokyo', 'Novel', 'Ilana Tan', 3, 3),
('N0017', 'Marmut Merah Jambu', 'Novel', 'Raditya Dika', 3, 3),
('N0018', 'Sherlock Holmes The Sign of Four', 'Novel', 'Sir Arthur Conan Doyle', 4, 4),
('N0019', 'Sherlock Holmes His Last Bow', 'Novel', 'Sir Arthur Conan Doyle', 5, 5),
('N0020', 'Kambing Jantan', 'Novel', 'Raditya Dika', 5, 5),
('T0001', 'Tafsir Ath-Thabari', 'Tafsir', 'Ibnu Jarir ath-Thabari', 5, 5),
('T0002', 'Tafsir Bahrul Ulum', 'Tafsir', 'Nashr bin Muhammad as-Samarqan', 5, 5),
('T0003', 'Tafsir Al-Baghawi', 'Tafsir', 'Abu Muhammad al-Hasan bin Mas’ud al-Baghawi', 2, 2),
('T0004', 'Tafsir Ats-Tsalabi', 'Tafsir', 'Abu Zaid Abdurrahman bin Muhammad ats-Tsalabi', 6, 6),
('T0005', 'Tafsir Ar-Razi', 'Tafsir', 'Fakhruddin ar-Razi', 3, 3),
('T0006', 'Tafsir Ath-Thabari', 'Tafsir', 'Ibnu Jarir ath-Thabari', 5, 5),
('T0007', 'Tafsir Bahrul Ulum', 'Tafsir', 'Nashr bin Muhammad as-Samarqandi', 4, 4),
('T0008', 'Tafsir Al-Muharrar', 'Tafsir', 'Abu Muhammad Abdul Haq bin Ghalib bin Athiyah', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `no_pinjam` int(11) NOT NULL,
  `id_anggota` varchar(6) NOT NULL,
  `id_petugas` varchar(7) NOT NULL,
  `id_buku` varchar(5) NOT NULL,
  `id_buku_d` varchar(5) DEFAULT NULL,
  `id_buku_t` varchar(5) DEFAULT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_peminjaman`
--

INSERT INTO `tb_peminjaman` (`no_pinjam`, `id_anggota`, `id_petugas`, `id_buku`, `id_buku_d`, `id_buku_t`, `tanggal`) VALUES
(1, 'A00003', 'B201001', 'N0011', 'B0004', NULL, '2022-07-01'),
(2, 'A00009', 'B201001', 'K0001', NULL, NULL, '2022-07-01'),
(3, 'A00016', 'A201002', 'K0003', NULL, NULL, '2022-06-30'),
(4, 'A00011', 'R201007', 'K0005', NULL, NULL, '2022-07-05'),
(5, 'A0001', 'A201002', 'K0006', NULL, NULL, '2022-07-12'),
(11, 'A00017', 'B201001', 'K0005', '', '', '2022-07-10'),
(13, 'A00015', 'A201004', 'B0004', '', '', '2022-07-13');

--
-- Triggers `tb_peminjaman`
--
DELIMITER $$
CREATE TRIGGER `update_stok_buku_pinjam` AFTER INSERT ON `tb_peminjaman` FOR EACH ROW BEGIN
	UPDATE tb_buku SET tersedia=stok-1
    WHERE id_buku=new.id_buku AND new.id_buku_d AND new.id_buku_t;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengembalian`
--

CREATE TABLE `tb_pengembalian` (
  `no_kembali` int(11) NOT NULL,
  `no_pinjam` int(11) NOT NULL,
  `id_buku` varchar(5) NOT NULL,
  `id_buku_d` varchar(5) DEFAULT NULL,
  `id_buku_t` varchar(5) DEFAULT NULL,
  `id_anggota` varchar(6) NOT NULL,
  `id_petugas` varchar(7) NOT NULL,
  `tanggal` date NOT NULL,
  `denda` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pengembalian`
--

INSERT INTO `tb_pengembalian` (`no_kembali`, `no_pinjam`, `id_buku`, `id_buku_d`, `id_buku_t`, `id_anggota`, `id_petugas`, `tanggal`, `denda`) VALUES
(1, 3, 'K0003', NULL, NULL, 'A00016', 'B201001', '2022-07-05', '0'),
(2, 1, 'N0011', 'B0004', NULL, 'A00003', 'B201001', '2022-07-05', '0'),
(4, 3, 'K0003', '', '', 'A00016', 'A201002', '2022-07-13', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` varchar(7) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `nama_petugas`, `alamat`, `no_hp`) VALUES
('A201002', 'Anton Cahya', 'Jl. Pelajar No.23', '+6281349568123'),
('A201003', 'Ani Rahman', 'Jl. Pegangsaan 1', '+6281249778123'),
('A201004', 'Arif Rahman', 'Jl. Pegangsaan 1', '+6281223678441'),
('A201010', 'Axel Bait', 'Perumahan Palagan Asri No 3', '+6281383035673'),
('B201001', 'Budi Wishnu', 'Jl. Pelajar No 30', '+6285228022613'),
('B201009', 'Bahdar Wibowo', 'Perumahan Intan Asri C.39', '+6283034938813'),
('C201005', 'Cintia Widyasari', 'Jl Padukuhan 4', '+6281383034956'),
('R201007', 'Rama Batu Bara', 'Jl Pegangsaan Timur 23', '+6281234578910'),
('R201008', 'Ratna Sari', 'Jl Sariharjo', '+6283901238675'),
('S201006', 'Susanto Budoyo', 'Jl Wirobrajan No 4', '+6282556437123');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rak`
--

CREATE TABLE `tb_rak` (
  `no_rak` int(11) NOT NULL,
  `genre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_rak`
--

INSERT INTO `tb_rak` (`no_rak`, `genre`) VALUES
(1, 'Novel'),
(2, 'Atlas'),
(3, 'Kamus'),
(4, 'Ensiklopedia'),
(5, 'Komik'),
(6, 'Biografi'),
(7, 'Teks'),
(8, 'Tafsir'),
(9, 'Karya Ilmiah'),
(10, 'Dongeng');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`no_pinjam`);

--
-- Indexes for table `tb_pengembalian`
--
ALTER TABLE `tb_pengembalian`
  ADD PRIMARY KEY (`no_kembali`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tb_rak`
--
ALTER TABLE `tb_rak`
  ADD PRIMARY KEY (`no_rak`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  MODIFY `no_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_pengembalian`
--
ALTER TABLE `tb_pengembalian`
  MODIFY `no_kembali` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_rak`
--
ALTER TABLE `tb_rak`
  MODIFY `no_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
