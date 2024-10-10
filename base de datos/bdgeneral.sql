-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2024 a las 21:16:59
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
-- Base de datos: `bdgeneral`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Telefono` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Tipodocu` varchar(50) NOT NULL,
  `Numerodocu` int(11) NOT NULL DEFAULT 0,
  `Contraseña` varchar(50) NOT NULL,
  `cachos` int(11) DEFAULT NULL,
  `Nombre_usuario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `numcomen` int(11) NOT NULL,
  `Comentario` varchar(150) DEFAULT NULL,
  `Numerodocu` int(11) DEFAULT NULL,
  `Archivo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Codigoproducto` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `numcomen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `FK_comentario_cliente` FOREIGN KEY (`Numerodocu`) REFERENCES `cliente` (`Numerodocu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
