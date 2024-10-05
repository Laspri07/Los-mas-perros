-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-10-2024 a las 14:41:56
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
  `Cedula` int NOT NULL,
  `Nombre1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Nombre2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Apellido1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Apellido2` varchar(50) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `Hojadevida` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Cedula`, `Nombre1`, `Nombre2`, `Apellido1`, `Apellido2`, `Correo`, `Ciudad`, `Area`, `Hojadevida`) VALUES
(1658975, 'Alejandro', NULL, 'Diaz', NULL, 'ale@gmail.com', 'Medellin', 'Chef', NULL),
(15478956, 'Alberto', NULL, 'Alarcon', NULL, 'alarcon@gmail.com', 'Pereira', 'Finanzas', NULL),
(16478596, 'Jose', NULL, 'Villegas', NULL, 'jose@gmail.com', 'Cartago', 'Mesero', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Cedula`);
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
  `Direccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tipodocu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Numerodocu` int NOT NULL DEFAULT '0',
  `Contraseña` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cachos` int DEFAULT NULL,
  `NumeroTarjeta` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Telefono`, `Nombre`, `Apellido`, `Correo`, `Direccion`, `Tipodocu`, `Numerodocu`, `Contraseña`, `cachos`, `NumeroTarjeta`) VALUES
(456, 'juan', 'velasquez', 'j@velas', 'cll13', 'cedula', 345, '2345', NULL, NULL),
(567, 'lili', 'arcila', 'l@arci', 'cll15', 'cedula', 808, '234', NULL, NULL),
(1234, 'sofia', 'lasprilla', 's@las', 'cll14', 'documento identidad', 1020, '123', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `Comentario` varchar(50) DEFAULT NULL,
  `Numerodocu` int DEFAULT NULL,
  `numcomen` int NOT NULL DEFAULT '0',
  `Archivo` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`Comentario`, `Numerodocu`, `numcomen`, `Archivo`) VALUES
('hola', 345, 0, NULL),
('Los mas Perros', 345, 2, NULL),
('Las mejores salchipapas', 345, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `IDfactura` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Numerodocu` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`IDfactura`, `Fecha`, `Numerodocu`) VALUES
(1, '2024-04-28', 345),
(3, '2024-04-28', 1020),
(4, '2024-08-25', 345),
(348263, '2024-04-28', 808);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `Codigoproducto` int NOT NULL,
  `Carne` varchar(50) DEFAULT NULL,
  `Adicional` varchar(50) DEFAULT NULL,
  `Salsa` varchar(50) DEFAULT NULL,
  `Papa` varchar(50) DEFAULT NULL,
  `Cantidad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IDfactura` int NOT NULL,
  `Subtotal` int NOT NULL,
  `Total` int NOT NULL,
  `Cupon` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`Codigoproducto`, `Carne`, `Adicional`, `Salsa`, `Papa`, `Cantidad`, `IDfactura`, `Subtotal`, `Total`, `Cupon`) VALUES
(2, 'lenteja', '', 'tomate', NULL, '1', 1, 20000, 40000, NULL),
(1, NULL, NULL, NULL, NULL, '6', 1, 20000, 40000, NULL);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `Numerotarjeta` int NOT NULL,
  `Banco` varchar(50) DEFAULT NULL,
  `Nombredueno` varchar(50) DEFAULT NULL,
  `Vencimiento` date DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  `ceduladueno` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`Numerotarjeta`, `Banco`, `Nombredueno`, `Vencimiento`, `CVV`, `ceduladueno`) VALUES
(487, 'Banco de bogota', 'lili', '2024-04-28', 549, 8484),
(789, 'Davivienda', 'juan', '2024-04-28', 456, 9544);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Numerodocu`),
  ADD KEY `NumeroTarjeta` (`NumeroTarjeta`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`numcomen`),
  ADD KEY `Numerodocu` (`Numerodocu`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`IDfactura`),
  ADD KEY `FK1Numerodocu` (`Numerodocu`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD KEY `IDfactura` (`IDfactura`),
  ADD KEY `Codigoproducto` (`Codigoproducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Codigoproducto`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`Numerotarjeta`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_cliente_tarjeta` FOREIGN KEY (`NumeroTarjeta`) REFERENCES `tarjeta` (`Numerotarjeta`);

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `FK_comentario_cliente` FOREIGN KEY (`Numerodocu`) REFERENCES `cliente` (`Numerodocu`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FK1Numerodocu` FOREIGN KEY (`Numerodocu`) REFERENCES `cliente` (`Numerodocu`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK1IDfactura` FOREIGN KEY (`IDfactura`) REFERENCES `factura` (`IDfactura`),
  ADD CONSTRAINT `FK2codigoproducto` FOREIGN KEY (`Codigoproducto`) REFERENCES `producto` (`Codigoproducto`);
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
