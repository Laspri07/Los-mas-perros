-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2024 a las 21:13:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdproveedor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Nombre` varchar(50) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `NIT` int(11) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `PyS` varchar(50) NOT NULL,
  `Comentario` varchar(50) DEFAULT NULL,
  `Archivo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Nombre`, `Telefono`, `NIT`, `Correo`, `PyS`, `Comentario`, `Archivo`) VALUES
('Delicias', 3214897596, 4578, '123456789', 'Comidas rapidas', 'hola', NULL),
('Ricuras', 3217894569, 456789123, 'Ricuras@gmail.com', 'Comidas rapidas', 'hola', NULL),
('SalchiMonster', 4567418529, 741258963, 'Salchimonster@gmail.com', 'Comidas rapidas', 'hola', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`NIT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
