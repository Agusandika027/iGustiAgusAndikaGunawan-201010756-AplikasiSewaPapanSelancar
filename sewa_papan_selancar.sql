-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jan 2023 pada 07.35
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
-- Database: `sewa_papan_selancar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `papan_selancar`
--

CREATE TABLE `papan_selancar` (
  `id_papan` char(11) NOT NULL,
  `merk` varchar(255) NOT NULL,
  `ukuran` enum('BESAR','SEDANG','KECIL') NOT NULL,
  `harga_sewa` int(50) NOT NULL,
  `status` enum('TERSEDIA','TIDAK TERSEDIA') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `papan_selancar`
--

INSERT INTO `papan_selancar` (`id_papan`, `merk`, `ukuran`, `harga_sewa`, `status`) VALUES
('1', 'adidos', 'BESAR', 200000, 'TERSEDIA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` char(11) NOT NULL,
  `nama_penyewa` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama_penyewa`, `alamat`, `no_telepon`) VALUES
('2', 'edwan', 'jalan angrek', '082265442158');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewa`
--

CREATE TABLE `sewa` (
  `id_sewa` char(11) NOT NULL,
  `id_papan` char(11) NOT NULL,
  `id_penyewa` char(11) NOT NULL,
  `tanggal_sewa` date NOT NULL,
  `lama_sewa` varchar(255) NOT NULL,
  `harga_total` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sewa`
--

INSERT INTO `sewa` (`id_sewa`, `id_papan`, `id_penyewa`, `tanggal_sewa`, `lama_sewa`, `harga_total`) VALUES
('1', '1', '2', '2023-02-05', '2 hari', 10),
('2', '1', '2', '2024-04-03', '3 hari', 10);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `papan_selancar`
--
ALTER TABLE `papan_selancar`
  ADD PRIMARY KEY (`id_papan`);

--
-- Indeks untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`);

--
-- Indeks untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `id_papan` (`id_papan`),
  ADD KEY `id_penyewa` (`id_penyewa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
