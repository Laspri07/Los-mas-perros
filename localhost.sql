-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-10-2024 a las 17:53:16
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdempleado`
--
CREATE DATABASE IF NOT EXISTS `bdempleado` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bdempleado`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Nombre1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Apellido1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `Hojadevida` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Nombre1`, `Apellido1`, `Correo`, `Ciudad`, `Area`, `Hojadevida`) VALUES
('Alberto', 'Alarcon', 'alarcon@gmail.com', 'Pereira', 'Finanzas', NULL),
('Alejandro', 'Diaz', 'ale@gmail.com', 'Medellin', 'Chef', NULL),
('Jose', 'Villegas', 'jose@gmail.com', 'Cartago', 'Mesero', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Correo`);
--
-- Base de datos: `bdgeneral`
--
CREATE DATABASE IF NOT EXISTS `bdgeneral` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bdgeneral`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Telefono` int NOT NULL,
  `Nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tipodocu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Numerodocu` int NOT NULL DEFAULT '0',
  `Contraseña` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cachos` int DEFAULT NULL,
  `Nombre_usuario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Telefono`, `Nombre`, `Apellido`, `Correo`, `Tipodocu`, `Numerodocu`, `Contraseña`, `cachos`, `Nombre_usuario`) VALUES
(456, 'juan', 'velasquez', 'j@velas', 'cedula', 345, '2345', NULL, ''),
(567, 'lili', 'arcila', 'l@arci', 'cedula', 808, '234', NULL, ''),
(1234, 'sofia', 'lasprilla', 's@las', 'documento identidad', 1020, '123', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `numcomen` int NOT NULL,
  `Comentario` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Numerodocu` int DEFAULT NULL,
  `Archivo` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`numcomen`, `Comentario`, `Numerodocu`, `Archivo`) VALUES
(1, 'hola', 345, NULL),
(2, 'Los mas Perros', 345, NULL),
(3, 'Las mejores salchipapas', 345, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Nombreproducto` varchar(50) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Precio` varchar(50) DEFAULT NULL,
  `Disponibilidad` varchar(50) DEFAULT NULL,
  `Codigoproducto` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Nombreproducto`, `Tipo`, `Descripcion`, `Precio`, `Disponibilidad`, `Codigoproducto`) VALUES
('Juan a lo perro', 'Perro', 'delicioso perro con...', '12000', 'si', 1),
('Alejandro a lo perro', 'Perro', 'Delicioso perro', '15000', 'si', 2),
('Cacho alegre', 'Hamburguesa', 'Con carne vegetariana, queso...', '13000', 'si', 3),
('Rios de mentiras personal', 'salchipapas', 'deliciosa', '12000', 'si', 4),
('Montonera de cacho personal', 'salchipapas', 'mentirosos', '15000', 'si', 5),
('Rios de mentiras familiar', 'salchipapas', 'deliciosa', '17000', 'si', 41);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Numerodocu`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`numcomen`),
  ADD KEY `Numerodocu` (`Numerodocu`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Codigoproducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `numcomen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `FK_comentario_cliente` FOREIGN KEY (`Numerodocu`) REFERENCES `cliente` (`Numerodocu`);
--
-- Base de datos: `bdproveedor`
--
CREATE DATABASE IF NOT EXISTS `bdproveedor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bdproveedor`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Telefono` bigint NOT NULL,
  `NIT` int NOT NULL,
  `Correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PyS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Comentario` varchar(50) DEFAULT NULL,
  `Archivo` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
