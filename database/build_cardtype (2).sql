-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2024 at 09:15 AM
-- Server version: 5.7.44-log
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infomeglobal_outeredge`
--

-- --------------------------------------------------------

--
-- Table structure for table `build_cardtype`
--

CREATE TABLE `build_cardtype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `show_in_form` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `build_cardtype`
--

INSERT INTO `build_cardtype` (`id`, `name`, `active`, `show_in_form`) VALUES
(1, 'Co-Host', 1, 0),
(2, 'Staff', 1, 0),
(3, 'Attendee', 1, 0),
(4, 'Distinguished Guest', 1, 0),
(5, 'Media', 1, 0),
(6, 'Speaker', 1, 0),
(7, 'Partner', 1, 0),
(8, 'Sponsor', 1, 0),
(9, 'Speaker | Co-Host', 1, 0),
(10, 'Speaker | Partner', 1, 0),
(11, 'Speaker | Sponsor', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `build_cardtype`
--
ALTER TABLE `build_cardtype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `build_cardtype`
--
ALTER TABLE `build_cardtype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
