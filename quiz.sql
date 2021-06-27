-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 08, 2019 at 07:29 AM
-- Server version: 5.6.41-84.1-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wrteabz6_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `authenticate`
--

CREATE TABLE `authenticate` (
  `auth_username` varchar(12) NOT NULL,
  `auth_pass` varchar(50) NOT NULL,
  `app_passcode` varchar(16) NOT NULL,
  `android_key` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authenticate`
--

INSERT INTO `authenticate` (`auth_username`, `auth_pass`, `app_passcode`, `android_key`) VALUES
('admin', '0192023a7bbd73250516f069df18b500', '1234', 'AAAAsN1MCCQ:APA91bHZsUwe5PselBvSA2D-qifLWbvwTXTAB-oFNUaeTWyzoinhJTP3ugp7gNcnQyvWHDvMtZ9zntGAstNuGFHMfqUnjhiwVvsgTLvvEsShF1CWWxMlFI_hp33hf7f67GypMUIdEYg9xEbpH1wl9nUw8FzYloZBAA');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `image` longtext CHARACTER SET utf8,
  `row_order` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--



-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` int(11) NOT NULL,
  `image` varchar(512) CHARACTER SET utf8 NOT NULL,
  `question` text CHARACTER SET utf8 NOT NULL,
  `optiona` varchar(100) CHARACTER SET utf8 NOT NULL,
  `optionb` varchar(100) CHARACTER SET utf8 NOT NULL,
  `optionc` varchar(100) CHARACTER SET utf8 NOT NULL,
  `optiond` varchar(100) CHARACTER SET utf8 NOT NULL,
  `answer` varchar(100) CHARACTER SET utf8 NOT NULL,
  `level` int(11) NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--


-- --------------------------------------------------------

--
-- Table structure for table `question_reports`
--

CREATE TABLE `question_reports` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `message` varchar(512) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_reports`
--


-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `message` varchar(4096) NOT NULL,
  `status` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `message`, `status`) VALUES
(1, 'privacy_policy', '<p>Privacy Policy goes here.</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `maincat_id` int(11) NOT NULL,
  `subcategory_name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `image` text CHARACTER SET utf8,
  `status` int(11) NOT NULL DEFAULT '1',
  `row_order` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--



-- --------------------------------------------------------

--
-- Table structure for table `tbl_devices`
--

CREATE TABLE `tbl_devices` (
  `id` int(10) NOT NULL,
  `token` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_devices`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_fcm_key`
--

CREATE TABLE `tbl_fcm_key` (
  `id` int(11) NOT NULL,
  `fcm_key` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_fcm_key`
--

INSERT INTO `tbl_fcm_key` (`id`, `fcm_key`) VALUES
(1, 'hftgjhm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_image`
--

CREATE TABLE `tbl_image` (
  `id` int(11) NOT NULL,
  `image` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_image`
--

INSERT INTO `tbl_image` (`id`, `image`) VALUES
(4, 'IMG_20180902_181456.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authenticate`
--
ALTER TABLE `authenticate`
  ADD PRIMARY KEY (`auth_username`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `subcategory` (`subcategory`) USING BTREE;

--
-- Indexes for table `question_reports`
--
ALTER TABLE `question_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_devices`
--
ALTER TABLE `tbl_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fcm_key`
--
ALTER TABLE `tbl_fcm_key`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_image`
--
ALTER TABLE `tbl_image`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2584;

--
-- AUTO_INCREMENT for table `question_reports`
--
ALTER TABLE `question_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `tbl_devices`
--
ALTER TABLE `tbl_devices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=826;

--
-- AUTO_INCREMENT for table `tbl_fcm_key`
--
ALTER TABLE `tbl_fcm_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_image`
--
ALTER TABLE `tbl_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
