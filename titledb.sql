-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 10, 2020 at 05:05 PM
-- Server version: 10.1.29-MariaDB-6
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS=OFF;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `titledb`
--

-- --------------------------------------------------------

--
-- Table structure for table `url`
--

CREATE TABLE `url` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
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

-- --------------------------------------------------------
--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` datetime(6) NOT NULL,
  `path` varchar(512) NOT NULL,
  `sha256` varchar(64) NOT NULL,
  `mapping` text,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE `entry` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `author` varchar(128) DEFAULT NULL,
  `headline` varchar(128) DEFAULT NULL,
  `description` text,
  `url` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `arm9`
--

CREATE TABLE `arm9` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` datetime(6) NOT NULL,
  `path` varchar(512) NOT NULL,
  `sha256` varchar(64) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `assets_id` int(11) DEFAULT NULL,
  `url_id` int(11) NOT NULL
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
  `active` bool DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `screenshot`
--

CREATE TABLE `screenshot` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  `path` varchar(512) NOT NULL,
  `sha256` varchar(64) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `smdh`
--

CREATE TABLE `smdh` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` datetime(6) NOT NULL,
  `path` varchar(512) NOT NULL,
  `sha256` varchar(64) NOT NULL,
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
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` bool DEFAULT NULL,
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
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `version` varchar(64) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `sha256` varchar(64) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `smdh_id` int(11) DEFAULT NULL,
  `xml_id` int(11) DEFAULT NULL,
  `assets_id` int(11) DEFAULT NULL,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xml`
--

CREATE TABLE `xml` (
  `id` int(11) NOT NULL,
  `active` bool DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` datetime(6) NOT NULL,
  `path` varchar(512) NOT NULL,
  `sha256` varchar(64) NOT NULL,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(191));

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD CONSTRAINT FOREIGN KEY (url_id) REFERENCES url (id);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entry`
--
ALTER TABLE `entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD CONSTRAINT FOREIGN KEY (category_id) REFERENCES category (id);

--
-- Indexes for table `arm9`
--
ALTER TABLE `arm9`
  ADD PRIMARY KEY (`id`),
  ADD CONSTRAINT FOREIGN KEY (entry_id) REFERENCES entry(id),
  ADD CONSTRAINT FOREIGN KEY (assets_id) REFERENCES assets(id),
  ADD CONSTRAINT FOREIGN KEY (url_id) REFERENCES url(id);

--
-- Indexes for table `cia`
--
ALTER TABLE `cia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `assets_id` (`assets_id`),
  ADD CONSTRAINT FOREIGN KEY (entry_id) REFERENCES entry (id),
  ADD CONSTRAINT FOREIGN KEY (assets_id) REFERENCES assets (id),
  ADD CONSTRAINT FOREIGN KEY (url_id) REFERENCES url (id);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `screenshot`
--
ALTER TABLE `screenshot`
  ADD PRIMARY KEY (`id`),
  ADD CONSTRAINT FOREIGN KEY (entry_id) REFERENCES entry (id),
  ADD CONSTRAINT FOREIGN KEY (url_id) REFERENCES url (id);
--
-- Indexes for table `smdh`
--
ALTER TABLE `smdh`
  ADD PRIMARY KEY (`id`),
  ADD CONSTRAINT FOREIGN KEY (entry_id) REFERENCES entry (id),
  ADD CONSTRAINT FOREIGN KEY (url_id) REFERENCES url (id);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tdsx`
--
ALTER TABLE `tdsx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_id` (`assets_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `smdh_id` (`smdh_id`),
  ADD KEY `xml_id` (`xml_id`),
  ADD CONSTRAINT FOREIGN KEY (entry_id) REFERENCES entry (id),
  ADD CONSTRAINT FOREIGN KEY (url_id) REFERENCES url (id);

--
-- Indexes for table `xml`
--
ALTER TABLE `xml`
  ADD PRIMARY KEY (`id`),
  ADD CONSTRAINT FOREIGN KEY (url_id) REFERENCES url (id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arm9`
--
ALTER TABLE `arm9`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cia`
--
ALTER TABLE `cia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entry`
--
ALTER TABLE `entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `screenshot`
--
ALTER TABLE `screenshot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smdh`
--
ALTER TABLE `smdh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission`
--
ALTER TABLE `submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tdsx`
--
ALTER TABLE `tdsx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `url`
--
ALTER TABLE `url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `xml`
--
ALTER TABLE `xml`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
