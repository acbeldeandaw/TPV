-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2021 at 03:39 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpv`
--
DROP DATABASE IF EXISTS `tpv`;
CREATE DATABASE IF NOT EXISTS `tpv` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tpv`;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `imagen` varchar(60) NOT NULL,
  `categoria` varchar(40) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `imagen`, `categoria`, `precio`) VALUES
(1, 'Hamburguesa normal', 'burger/normal.png', 'hamburguesas', 5.00),
(2, 'Hamburguesa con queso', 'burger/queso.png', 'hamburguesas', 5.50),
(3, 'Nuggets', 'burger/nuggets.png', 'complementos', 3.00),
(4, 'Aros de cebolla', 'burger/aros.png', 'complementos', 2.00),
(7, 'Agua', 'burger/agua.png', 'bebidas', 2.00),
(8, 'Coca-Cola', 'burger/cocacola.png', 'bebidas', 2.00),
(9, 'Sprite', 'burger/sprite.png', 'bebidas', 2.00),
(10, 'Fanta', 'burger/fanta.png', 'bebidas', 2.00),
(11, 'Hamburguesa doble', 'burger/doble.png', 'hamburguesas', 7.00),
(12, 'Patatas fritas', 'burger/patatas.png', 'complementos', 1.50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
