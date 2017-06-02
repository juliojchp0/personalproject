-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2016 a las 13:23:11
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `daw201308_com`
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE IF NOT EXISTS `anuncios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `created` date NOT NULL,
  `province_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `anuncios`
--

INSERT INTO `anuncios` (`id`, `nombre`, `descripcion`, `precio`, `created`, `province_id`, `user_id`) VALUES
(29, 'Microondas Samsung', '<p style="margin: 0px 0px 1em; padding: 0px; color: #333333; font-family: ''lucida grande'', verdana, helvetica, arial, sans-serif; font-size: 14px; background-color: #f9f9f9;">Microondas con opci&oacute;n de grill y de microondas tradicional</p>\r\n<p style="margin: 0px 0px 1em; padding: 0px; color: #333333; font-family: ''lucida grande'', verdana, helvetica, arial, sans-serif; font-size: 14px; background-color: #f9f9f9;">Temporizador anal&oacute;gico, sistema de seguridad en la puerta</p>', 335, '2014-02-08', 5, 2),
(28, 'Coche', '<p>Ford Mondeo del 2002. 125Cv. 2000cc</p>\r\n<p>Carrocer&iacute;a en perfecto estado. Interior</p>\r\n<p>muy cuidad. 10.000km.</p>', 40000, '2014-02-08', 1, 3),
(24, 'Movil', '<p>Samsung Galaxy Ace. 220 Memoria Ram. 550Mhz de procesador</p>\r\n<p>Pantalla tactil. C&aacute;mara de 5 Mpx con flash incorporado</p>', 254, '2014-02-08', 1, 2),
(30, 'Lavadora', '<p style="margin: 0px 0px 1em; padding: 0px; color: #333333; font-family: ''lucida grande'', verdana, helvetica, arial, sans-serif; font-size: 14px;">Lavadora Fagor de 60kg. Tiene opcion secadora</p>\r\n<p style="margin: 0px 0px 1em; padding: 0px; color: #333333; font-family: ''lucida grande'', verdana, helvetica, arial, sans-serif; font-size: 14px;">conexi&oacute;n a la red electrica manual y salida de agua</p>\r\n<p style="margin: 0px 0px 1em; padding: 0px; color: #333333; font-family: ''lucida grande'', verdana, helvetica, arial, sans-serif; font-size: 14px;">de 3pulgadas.</p>', 562, '2014-02-08', 5, 2),
(26, 'Lavadora', '<p>Lavadora Fagor de 60kg. Tiene opcion secadora</p>\r\n<p>conexi&oacute;n a la red electrica manual y salida de agua</p>\r\n<p>de 3pulgadas.</p>', 269, '2014-02-08', 4, 2),
(31, 'Motosierra', '<p>Motosierra de 125cv. Gasolina</p>\r\n<p>Cadena larga, inyeccion directa</p>', 354, '2014-02-09', 3, 2),
(32, 'Coche', '<p>Renault Megane 125cv. 2000cc.</p>\r\n<p>10.000km en buen estado. Tapicer&iacute;a&nbsp;</p>\r\n<p>nueva</p>', 3000, '2014-02-09', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios_users`
--

CREATE TABLE IF NOT EXISTS `anuncios_users` (
  `anuncio_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`anuncio_id`,`user_id`),
  KEY `anuncio_id` (`anuncio_id`),
  KEY `usuario_id` (`user_id`),
  KEY `anuncio_id_2` (`anuncio_id`),
  KEY `anuncio_id_3` (`anuncio_id`),
  KEY `anuncio_id_4` (`anuncio_id`),
  KEY `usuario_id_2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE IF NOT EXISTS `favoritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `anuncio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cake_favorito_ibk_1_idx` (`anuncio_id`),
  KEY `cake_favorito_ibk_2_idx` (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `anuncio_id` (`anuncio_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id`, `user_id`, `anuncio_id`) VALUES
(4, 2, 28),
(5, 2, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE IF NOT EXISTS `fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_archivo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `principal` tinyint(4) NOT NULL,
  `anuncio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`anuncio_id`),
  KEY `usuario_id_2` (`anuncio_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`id`, `nombre_archivo`, `principal`, `anuncio_id`) VALUES
(2, 'Captura1.JPG', 1, 12),
(3, 'Pantalla1.png', 1, 15),
(4, 'images.jpg', 1, 24),
(5, 'descarga.jpg', 1, 25),
(6, 'descarga.jpg', 1, 27),
(7, 'descarga.jpg', 1, 28),
(8, 'microondas.jpg', 1, 29),
(9, 'lavadoras-13.jpg', 1, 30),
(10, 'motosierra.jpg', 1, 31),
(11, 'megane.jpg', 1, 32),
(12, '1527792_638831149509033_1891030040_n.jpg', 1, 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provinces`
--

CREATE TABLE IF NOT EXISTS `provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `provinces`
--

INSERT INTO `provinces` (`id`, `provincia`) VALUES
(1, 'Ciudad Real'),
(2, 'Albacete'),
(3, 'Toledo'),
(4, 'Guadalajara'),
(5, 'Cuenca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `provincia` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nombre`, `apellidos`, `provincia`, `ciudad`, `telefono`, `fecha_nacimiento`) VALUES
(2, 'j@j.com', 'ddb2fcd43b9220422ad96eda9c30df5c94b3439d', 'adf', 'adf', 'as', 'asf', '233432', '2014-02-01'),
(3, 'a@a.com', 'ddb2fcd43b9220422ad96eda9c30df5c94b3439d', 'adsf', 'asdf', 'asdf', 'asfd', '12655', '2014-02-01'),
(4, 'c@c.com', 'ddb2fcd43b9220422ad96eda9c30df5c94b3439d', 'adsf', 'asdf', 'asdfads', 'ads', '2334', '2014-02-02');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
