-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Feb 2023 pada 13.30
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lunette`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_kalla`
--

CREATE TABLE `admin_kalla` (
  `id_admin` int(250) NOT NULL,
  `nama_lengkap` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `no_hp` int(50) NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(250) NOT NULL,
  `kata_sandi` varchar(250) NOT NULL,
  `tingkat` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin_kalla`
--

INSERT INTO `admin_kalla` (`id_admin`, `nama_lengkap`, `email`, `no_hp`, `alamat`, `username`, `kata_sandi`, `tingkat`) VALUES
(1, 'admin', 'aiminnur02@gmail.com', 2147483647, 'perumdos unhas', 'admin', 'admin', 'admin'),
(2, 'jasmin', 'muhaimin@kallabs.ac.id', 2147483647, 'perumdos unhas block', 'user', 'user', 'user'),
(4, 'aimin', 'projectwebfinal@gmail.com', 2147483647, 'perumdos unhas', 'kbs', 'kallabs', 'user'),
(5, 'ansar', 'projectwebfinal@gmail.com', 2147483647, 'perumdos unhas', 'tester', 'tester', 'User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `row_id` int(100) NOT NULL,
  `kode_produk` int(250) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `gambar_produk` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `qty` int(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `total` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`row_id`, `kode_produk`, `nama_produk`, `gambar_produk`, `kategori`, `deskripsi`, `qty`, `harga`, `total`) VALUES
(0, 99382, 'Pasmina Katun', 'WhatsApp Image 2022-12-24 at 16.06.27.jpeg', 'Hijab Pasmina', 'Hijab Tranding', 1, 35000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `row_id` int(250) NOT NULL,
  `kode_produk` int(250) NOT NULL,
  `nama_depan` varchar(100) NOT NULL,
  `nama_belakang` varchar(250) NOT NULL,
  `email` text NOT NULL,
  `kota` varchar(250) NOT NULL,
  `alamat` text NOT NULL,
  `kecamatan` varchar(200) NOT NULL,
  `kode_pos` int(100) NOT NULL,
  `bank` varchar(200) NOT NULL,
  `nomor_hp` int(100) NOT NULL,
  `notes` varchar(250) NOT NULL,
  `qty` int(150) NOT NULL,
  `total` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`row_id`, `kode_produk`, `nama_depan`, `nama_belakang`, `email`, `kota`, `alamat`, `kecamatan`, `kode_pos`, `bank`, `nomor_hp`, `notes`, `qty`, `total`) VALUES
(19, 12231, 'aimin', 'nur', 'projectwebfinal@gmail.com', 'Makassar', 'perumdos unhas', 'perintis', 928220, '1', 292381893, '', 5, 150000),
(20, 99382, 'ansar', 'kalla', 'projectwebfinal@gmail.com', 'Pilih kota anda', 'perumdos unhas', 'tamalanrea', 2147483647, '5', 828827127, '', 1, 35000);

--
-- Trigger `payment`
--
DELIMITER $$
CREATE TRIGGER `payment` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN
UPDATE produk SET stok = stok - NEW.qty  
WHERE kode_produk = NEW.kode_produk;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `row_id` int(50) NOT NULL,
  `kode_produk` int(50) NOT NULL,
  `gambar_produk` varchar(110) NOT NULL,
  `nama_produk` varchar(110) NOT NULL,
  `deskripsi` varchar(110) NOT NULL,
  `kategori` varchar(110) NOT NULL,
  `stok` int(250) NOT NULL,
  `harga` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`row_id`, `kode_produk`, `gambar_produk`, `nama_produk`, `deskripsi`, `kategori`, `stok`, `harga`) VALUES
(35, 12231, 'WhatsApp Image 2022-12-24 at 16.01.11.jpeg', 'Paris Voal', 'Hijab Tranding', 'Hijab Square', 16, '30000'),
(37, 20123, 'WhatsApp Image 2022-12-24 at 16.07.30.jpeg', 'Pasmina Silk', 'Hijab Tranding', 'Hijab Pasmina', 50, '35000'),
(34, 22123, 'WhatsApp Image 2022-12-24 at 16.02.23.jpeg', 'Pasmina Babydoll', 'Hijab Tranding', 'Hijab Pasmina', 25, ' 35000'),
(36, 99382, 'WhatsApp Image 2022-12-24 at 16.06.27.jpeg', 'Pasmina Katun', 'Hijab Tranding', 'Hijab Pasmina', 23, '35000');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_kalla`
--
ALTER TABLE `admin_kalla`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`kode_produk`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`row_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_kalla`
--
ALTER TABLE `admin_kalla`
  MODIFY `id_admin` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `kode_produk` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99383;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `row_id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `kode_produk` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99383;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
