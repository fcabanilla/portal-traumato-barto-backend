-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-01-2020 a las 22:35:40
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

--
-- Volcado de datos para la tabla `poll`
--

INSERT INTO `poll` (`idpoll`, `iduser_author`, `idtype_of_poll`, `idempty_poll`, `idprocedure`, `description`, `create_date`, `erased`) VALUES
('0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 'c1f1d5de-3a64-11ea-8f17-48ba4e44ff52', '4dcecc11-3b14-11ea-9f3e-48ba4e44ff52', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'ba9f80a2-305e-11ea-9402-ac220b26bfde', 'REEMPLAZO ARTICULAR DE RODILLA', '2020-01-19 23:39:57', 0);

--
-- Volcado de datos para la tabla `poll_detail`
--

INSERT INTO `poll_detail` (`idpoll_detail`, `idquestion`, `idanswer`, `idpoll`, `erased`) VALUES
('00223e06-3b15-11ea-9f3e-48ba4e44ff52', 'f1ca5029-2faa-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0),
('00231212-3b15-11ea-9f3e-48ba4e44ff52', '0354809a-2fab-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0),
('0023e4ac-3b15-11ea-9f3e-48ba4e44ff52', '0ccf69e2-2fab-11ea-9402-ac220b26bfde', 'cf9c6741-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0),
('0024f3b3-3b15-11ea-9f3e-48ba4e44ff52', '1b168aaa-2fab-11ea-9402-ac220b26bfde', 'cf9c6741-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0),
('0025ac2e-3b15-11ea-9f3e-48ba4e44ff52', '2450a948-2fab-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
