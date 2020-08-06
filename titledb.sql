-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 06, 2020 at 02:15 PM
-- Server version: 10.1.29-MariaDB-6
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `giochi`
--

-- --------------------------------------------------------

--
-- Table structure for table `arm9`
--

CREATE TABLE `arm9` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `path` int(11) NOT NULL,
  `sha256` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `assets_id` int(11) DEFAULT NULL,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `path` int(11) NOT NULL,
  `sha256` int(11) NOT NULL,
  `mapping` text,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cia`
--

CREATE TABLE `cia` (
  `cia` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `titleid` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name_s` varchar(64) DEFAULT NULL,
  `name_l` varchar(128) DEFAULT NULL,
  `publisher` varchar(64) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `sha256` varchar(64) DEFAULT NULL,
  `assets_id` int(11) DEFAULT NULL,
  `icon_s` varchar(1536) DEFAULT NULL,
  `icon_l` varchar(6144) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cia`
--

INSERT INTO `cia` (`cia`, `entry_id`, `titleid`, `created_at`, `updated_at`, `name_s`, `name_l`, `publisher`, `active`, `size`, `mtime`, `url_id`, `version`, `path`, `sha256`, `assets_id`, `icon_s`, `icon_l`, `id`, `url`) VALUES
(0, 0, '000400000DAED300', NULL, NULL, 'DaedalusX64', 'DaedalusX64 port for 3DS', 'MasterFeizz', 1, 512960, '2020-07-07 12:05:23', 4, '64', NULL, '8645196fceda02b9c266679fc7b8b95fe687e94efd5863ab1461237e8df587fc', NULL, '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', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE `entry` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `author` varchar(128) DEFAULT NULL,
  `headline` varchar(128) DEFAULT NULL,
  `description` text,
  `url` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `entry`
--

INSERT INTO `entry` (`id`, `active`, `created_at`, `updated_at`, `category_id`, `name`, `author`, `headline`, `description`, `url`) VALUES
(0, 1, 0, 0, 0, '0', '0', '0', '0', '0'),
(0, 1, 0, 0, NULL, '0', '0', '0', NULL, NULL),
(0, 1, 0, 0, NULL, 'DaedalusX64', 'MasterFeizz', 'DaedalusX64 port for 3DS', NULL, NULL),
(0, 1, 0, 0, NULL, 'SMDH decode failed', 'SMDH decode failed', 'SMDH decode failed', NULL, NULL),
(0, 1, 0, 0, NULL, 'DaedalusX64', 'MasterFeizz', 'DaedalusX64 port for 3DS', NULL, NULL),
(0, 1, 0, 0, NULL, 'DaedalusX64', 'MasterFeizz', 'DaedalusX64 port for 3DS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `active`, `created_at`, `updated_at`, `name`) VALUES
(1, 1, '2020-08-05 20:51:45', '2020-08-05 20:51:45', 'super'),
(2, 1, '2020-08-05 20:51:45', '2020-08-05 20:51:45', 'super'),
(3, 1, '2020-08-05 20:51:45', '2020-08-05 20:51:45', 'super');

-- --------------------------------------------------------

--
-- Table structure for table `screenshot`
--

CREATE TABLE `screenshot` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `path` int(11) NOT NULL,
  `sha256` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `smdh`
--

CREATE TABLE `smdh` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `path` int(11) NOT NULL,
  `sha256` int(11) NOT NULL,
  `name_s` varchar(64) DEFAULT NULL,
  `name_l` varchar(128) DEFAULT NULL,
  `publisher` varchar(64) DEFAULT NULL,
  `icon_s` varchar(1536) DEFAULT NULL,
  `icon_l` varchar(6144) DEFAULT NULL,
  `url_id` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `smdh_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `status` varchar(1024) DEFAULT NULL,
  `client_addr` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tdsx`
--

CREATE TABLE `tdsx` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `path` int(11) NOT NULL,
  `sha256` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `smdh_id` int(11) DEFAULT NULL,
  `xml_id` int(11) DEFAULT NULL,
  `assets_id` int(11) DEFAULT NULL,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `url`
--

CREATE TABLE `url` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `filename` varchar(256) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `etag` varchar(512) DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  `content_type` varchar(64) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `sha256` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `url`
--

INSERT INTO `url` (`id`, `active`, `created_at`, `updated_at`, `url`, `filename`, `version`, `etag`, `mtime`, `content_type`, `size`, `sha256`) VALUES
(4, 1, NULL, NULL, 'https://cdn.discordapp.com/attachments/726387225755123792/730031713790590976/DaedalusX64.cia', 'DaedalusX64.cia', '64', '24de66e31abc6464bf1f4acca40b1d44', '2020-07-07 12:05:23', 'application/x-3ds-archive', 512960, '8645196fceda02b9c266679fc7b8b95fe687e94efd5863ab1461237e8df587fc');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `active`, `created_at`, `updated_at`, `name`, `password`, `email`) VALUES
(0, 1, 0, 0, 'Vincysuper07', 'lapasswordesempretestu', 'vincysuper07@gmail.com'),
(0, 1, 0, 0, 'Vincysuper07', 'lapasswordesempretestu', 'vincysuper07@gmail.com'),
(0, 1, 0, 0, 'Vincysuper07', 'lapasswordesempretestu', 'vincysuper07@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `xml`
--

CREATE TABLE `xml` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `path` int(11) NOT NULL,
  `sha256` int(11) NOT NULL,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cia`
--
ALTER TABLE `cia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cia`
--
ALTER TABLE `cia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `url`
--
ALTER TABLE `url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
