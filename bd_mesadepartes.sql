-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-09-2020 a las 01:40:10
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_mesadepartes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

DROP TABLE IF EXISTS `documentos`;
CREATE TABLE IF NOT EXISTS `documentos` (
  `idDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `tipoDocumento` varchar(45) DEFAULT NULL,
  `tipoInstrumento` varchar(45) DEFAULT NULL,
  `folios` varchar(45) DEFAULT NULL,
  `minutario` varchar(45) DEFAULT NULL,
  `minuta` varchar(45) DEFAULT NULL,
  `fojas` varchar(45) DEFAULT NULL,
  `indice` varchar(45) DEFAULT NULL,
  `Solicitudes_idSolicitud` int(11) NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `fk_Documentos_Solicitudes1_idx` (`Solicitudes_idSolicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `idEstado` varchar(8) NOT NULL,
  `TipoEstado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idEstado`, `TipoEstado`) VALUES
('DOCEMIT', 'Documento emitido'),
('ESPPAGO', 'Esperando pago'),
('PROCBUSQ', 'En proceso de busqueda'),
('PROCEMIS', 'En proceso de emisión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `involucrados`
--

DROP TABLE IF EXISTS `involucrados`;
CREATE TABLE IF NOT EXISTS `involucrados` (
  `idInvolucrado` int(11) NOT NULL AUTO_INCREMENT,
  `tipoInvolucrado` varchar(45) DEFAULT NULL,
  `NombreCompleto` varchar(45) DEFAULT NULL,
  `Documentos_idDocumento` int(11) NOT NULL,
  PRIMARY KEY (`idInvolucrado`),
  KEY `fk_Involucrados_Documentos1_idx` (`Documentos_idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notarios`
--

DROP TABLE IF EXISTS `notarios`;
CREATE TABLE IF NOT EXISTS `notarios` (
  `RUC` varchar(10) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `ubicacion` text,
  PRIMARY KEY (`RUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notarios`
--

INSERT INTO `notarios` (`RUC`, `nombres`, `apellidos`, `telefono`, `ubicacion`) VALUES
('1234567890', 'Ciro Alfredo', 'Galvez Herrera', '064217480', 'Calle Real 585 Huancayo'),
('1234567891', 'Mercedes María', 'Aleluya Vera', '064235660', 'Calle Real 622 Chilca'),
('1234567892', 'Ronald Romulo', 'Venero Bocangel', '970045750', 'Jr. Moquegua 191 Huancayo'),
('1234567893', 'Elsa Victoria', 'Canchaya Sánchez', '064224290', 'Jr. Loreto 356-358 Huancayo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitantes`
--

DROP TABLE IF EXISTS `solicitantes`;
CREATE TABLE IF NOT EXISTS `solicitantes` (
  `DNI` varchar(8) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidoPaterno` varchar(45) DEFAULT NULL,
  `apellidoMaterno` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitantes`
--

INSERT INTO `solicitantes` (`DNI`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `telefono`, `email`) VALUES
('70416701', 'Miguel', 'Torres', 'Vargas', '935378911', 'miguel@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE IF NOT EXISTS `solicitudes` (
  `idSolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `fechaRegistro` date DEFAULT NULL,
  `otorgadoX` varchar(45) DEFAULT NULL,
  `aFavor` varchar(45) DEFAULT NULL,
  `fechaDoc` date DEFAULT NULL,
  `pathVoucher` text,
  `fechaPago` varchar(45) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `Estados_idEstado` varchar(8) NOT NULL,
  `Notarios_RUC` varchar(10) NOT NULL,
  `Solicitantes_DNI` varchar(8) NOT NULL,
  `Usuarios_DNI` varchar(8) NOT NULL,
  PRIMARY KEY (`idSolicitud`),
  KEY `fk_Solicitudes_Estados1_idx` (`Estados_idEstado`),
  KEY `fk_Solicitudes_Notarios1_idx` (`Notarios_RUC`),
  KEY `fk_Solicitudes_Solicitantes1_idx` (`Solicitantes_DNI`),
  KEY `fk_Solicitudes_Usuarios1_idx` (`Usuarios_DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`idSolicitud`, `fechaRegistro`, `otorgadoX`, `aFavor`, `fechaDoc`, `pathVoucher`, `fechaPago`, `fechaEntrega`, `Estados_idEstado`, `Notarios_RUC`, `Solicitantes_DNI`, `Usuarios_DNI`) VALUES
(2, '2020-09-25', 'Pepito', 'Juanito', '1990-01-20', NULL, NULL, NULL, 'PROCBUSQ', '1234567891', '70416701', '78965433'),
(3, '2020-09-25', 'Paco', 'Luis', NULL, NULL, NULL, NULL, 'PROCBUSQ', '1234567891', '70416701', '78965433');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `DNI` varchar(8) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidoPaterno` varchar(45) DEFAULT NULL,
  `apellidoMaterno` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`DNI`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `telefono`, `email`, `direccion`, `rol`) VALUES
('78965433', 'Alonso', 'Mamani', 'Quispe', '978564321', 'alonso@gmail.com', 'Jr. Loreto 675 Huancayo', 'Atención al Cliente');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `fk_Documentos_Solicitudes1` FOREIGN KEY (`Solicitudes_idSolicitud`) REFERENCES `solicitudes` (`idSolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `involucrados`
--
ALTER TABLE `involucrados`
  ADD CONSTRAINT `fk_Involucrados_Documentos1` FOREIGN KEY (`Documentos_idDocumento`) REFERENCES `documentos` (`idDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `fk_Solicitudes_Estados1` FOREIGN KEY (`Estados_idEstado`) REFERENCES `estados` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Solicitudes_Notarios1` FOREIGN KEY (`Notarios_RUC`) REFERENCES `notarios` (`RUC`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Solicitudes_Solicitantes1` FOREIGN KEY (`Solicitantes_DNI`) REFERENCES `solicitantes` (`DNI`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Solicitudes_Usuarios1` FOREIGN KEY (`Usuarios_DNI`) REFERENCES `usuarios` (`DNI`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
