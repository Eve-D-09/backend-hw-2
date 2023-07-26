-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2023 at 04:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars-sql-hw`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `make` varchar(24) NOT NULL,
  `model` varchar(24) NOT NULL,
  `year` int(11) NOT NULL,
  `transmission` varchar(2) NOT NULL,
  `fuel_type` varchar(12) NOT NULL,
  `drive` varchar(3) NOT NULL,
  `class` varchar(24) NOT NULL,
  `is_sold` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `make`, `model`, `year`, `transmission`, `fuel_type`, `drive`, `class`, `is_sold`) VALUES
(1, 'lexus', 'rx350h', 2022, 'a', 'gas', '4wd', 'standard sport utility v', 1),
(2, 'jaguar', 'f-type r awd convertible', 2023, 'a', 'gas', 'awd', 'two seater', 1),
(3, 'land rover', 'defender 90', 2023, 'a', 'gas', '4wd', 'standard sport utility v', 1),
(4, 'lexus', 'rx', 2020, 'a', 'gas', 'fwd', 'mini compact car', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(331) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `country` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `surname`, `country`) VALUES
(1, 'Victor', 'Horta', 'be'),
(2, 'Adolphe', 'Sax', 'be'),
(3, 'romelu', 'lukaku', 'be'),
(4, 'Eden', 'Hazard', 'be'),
(5, 'Axel', 'Witsel', 'be'),
(6, 'emma', 'jones', 'be'),
(100, 'emma', 'jones', 'be');

-- --------------------------------------------------------

--
-- Table structure for table `customers_cars`
--

CREATE TABLE `customers_cars` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_cars`
--

INSERT INTO `customers_cars` (`id`, `customer_id`, `car_id`) VALUES
(1, 1, 1),
(2, 4, 2),
(3, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customers_details`
--

CREATE TABLE `customers_details` (
  `customer_id` int(11) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `email` varchar(331) NOT NULL,
  `password` varchar(32) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_details`
--

INSERT INTO `customers_details` (`customer_id`, `phone_number`, `email`, `password`, `date_joined`) VALUES
(1, '0323232456', 'victor@gmail.com', '', '2023-07-25 07:02:15'),
(2, '0323232789', 'adolph@gmail.com', '', '2023-07-25 07:02:15'),
(3, '321321654', 'romelu@gmail.com', '', '2023-07-25 09:37:35'),
(4, '322222332', 'eden@gmail.com', '', '2023-07-25 09:49:11'),
(5, '', 'axel@gmail.com', '', '2023-07-25 09:50:02'),
(6, '', 'daniela@gmail.com', '123', '2023-07-25 11:55:34'),
(7, '', 'eve@gmail.com', '123', '2023-07-25 11:47:57'),
(8, '', 'olivija@gmail.com', '123', '2023-07-25 12:34:20'),
(9, '', 'emma@gmail.com', '123', '2023-07-25 12:42:59'),
(100, '', 'samanta@gmail.com', '123', '2023-07-25 12:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `customer_id` int(11) NOT NULL,
  `line_1` varchar(64) NOT NULL,
  `line_2` varchar(64) NOT NULL,
  `post_code` int(5) NOT NULL,
  `country` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`customer_id`, `line_1`, `line_2`, `post_code`, `country`) VALUES
(1, 'rue royale 123', 'brussels', 1020, 32),
(1, 'avenua albert 101', 'brussels', 1040, 32),
(2, 'boulvard max 56', 'brussels', 1200, 32),
(3, '', '', 1200, 32),
(4, 'Boulevard de Waterloo', 'Brussels', 1000, 32),
(5, 'Avenue Louise 55', 'Brussels', 1200, 32);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_cars`
-- (See below for the actual view)
--
CREATE TABLE `customer_cars` (
);

-- --------------------------------------------------------

--
-- Structure for view `customer_cars`
--
DROP TABLE IF EXISTS `customer_cars`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_cars`  AS SELECT `customers`.`name` AS `name`, `cars`.`make` AS `make` FROM ((`customers` join `customers_cars` on(`customers`.`id` = `customers_cars`.`customer_id`)) join `cars` on(`customers_cars`.`car_id` = `cars`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customers_cars`
--
ALTER TABLE `customers_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_details`
--
ALTER TABLE `customers_details`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `customers_cars`
--
ALTER TABLE `customers_cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers_details`
--
ALTER TABLE `customers_details`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
