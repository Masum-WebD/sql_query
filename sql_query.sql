-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 03:20 PM
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
-- Database: `sql_query`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `name` varchar(155) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT curtime(),
  `update_at` timestamp NOT NULL DEFAULT curtime() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `create_at`, `update_at`) VALUES
(1, 'Official', '2023-11-21 06:24:13', '2023-11-21 06:24:13'),
(2, 'Unofficial', '2023-11-21 06:24:13', '2023-11-21 06:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL COMMENT 'Primary Key',
  `name` varchar(155) NOT NULL,
  `email` varchar(155) NOT NULL,
  `location` varchar(155) NOT NULL,
  `create_time` datetime DEFAULT NULL COMMENT 'Create Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `location`, `create_time`) VALUES
(1, 'John', 'john@example.com', 'Canada', NULL),
(2, 'jody', 'jody@example.com', 'Canada', NULL),
(3, 'Abraham', 'Abraham@example.com', 'Australia', NULL),
(4, 'Milcon', 'milcon@example.com', 'Australia', NULL),
(5, 'Jadeja', 'jadeja@example.com', 'India', NULL),
(6, 'Mexwell', 'mexwell@example.com', 'Australia', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL COMMENT 'Primary Key',
  `customer_id` bigint(20) NOT NULL,
  `order_date` datetime DEFAULT NULL COMMENT 'Order Date',
  `total` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT 'Create Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`, `total`, `create_time`) VALUES
(1, 2, '0000-00-00 00:00:00', 500, NULL),
(2, 5, '0000-00-00 00:00:00', 1500, NULL),
(3, 4, '0000-00-00 00:00:00', 700, NULL),
(4, 2, '0000-00-00 00:00:00', 2500, NULL),
(5, 1, '0000-00-00 00:00:00', 900, NULL),
(6, 3, '0000-00-00 00:00:00', 2000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL COMMENT 'Primary Key',
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT curtime(),
  `updated_at` timestamp NOT NULL DEFAULT curtime() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `create_at`, `updated_at`) VALUES
(1, 1, 4, 2, 50, '2023-11-21 06:48:49', '2023-11-21 06:48:49'),
(2, 1, 4, 2, 50, '2023-11-21 06:48:49', '2023-11-21 06:48:49'),
(3, 2, 5, 4, 10, '2023-11-21 06:48:49', '2023-11-21 06:48:49'),
(4, 4, 4, 1, 5000, '2023-11-21 06:48:49', '2023-11-21 06:48:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL COMMENT 'Primary Key',
  `name` varchar(155) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(15) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT curtime(),
  `Update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_id` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `create_at`, `Update_at`, `category_id`) VALUES
(1, 'Brash', 'This is good product', '50', '2023-11-21 05:47:43', '2023-11-21 13:22:34', '1'),
(2, 'Mobile', 'This is good product', '5000', '2023-11-21 05:47:43', '2023-11-21 13:22:34', '1'),
(3, 'Laptop', 'This is good product', '50000', '2023-11-21 05:47:43', '2023-11-21 13:22:34', '2'),
(4, 'Headphone', 'This is good product', '500', '2023-11-21 05:47:43', '2023-11-21 13:22:34', '2'),
(5, 'Keyboard', 'This is good product', '700', '2023-11-21 05:47:43', '2023-11-21 13:22:34', '1'),
(6, 'Mouse', 'This is good product', '400', '2023-11-21 05:47:43', '2023-11-21 13:22:34', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
