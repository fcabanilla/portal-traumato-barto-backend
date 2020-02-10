-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-02-2020 a las 16:15:36
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `answer`
--

CREATE TABLE `answer` (
  `idanswer` varchar(60) NOT NULL,
  `idtype_of_answer` varchar(60) NOT NULL,
  `answer` varchar(60) NOT NULL,
  `score` tinyint(4) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `answer`
--

INSERT INTO `answer` (`idanswer`, `idtype_of_answer`, `answer`, `score`, `erased`) VALUES
('02cc0856-44a9-11ea-85d8-48ba4e44ff52', '02cb456d-44a9-11ea-85d8-48ba4e44ff52', 'CEMENTADO', 0, 0),
('02cc9021-44a9-11ea-85d8-48ba4e44ff52', '02cb456d-44a9-11ea-85d8-48ba4e44ff52', 'NO CEMENTADO', 0, 0),
('0706a9c7-463a-11ea-85d8-48ba4e44ff52', '070603f0-463a-11ea-85d8-48ba4e44ff52', '5-10 grados', -2, 0),
('070a25b0-463a-11ea-85d8-48ba4e44ff52', '070603f0-463a-11ea-85d8-48ba4e44ff52', '11-15 grados', -5, 0),
('070ab92a-463a-11ea-85d8-48ba4e44ff52', '070603f0-463a-11ea-85d8-48ba4e44ff52', '16-20 grados', -10, 0),
('070b4f50-463a-11ea-85d8-48ba4e44ff52', '070603f0-463a-11ea-85d8-48ba4e44ff52', 'Mayor a 20 grados', -15, 0),
('091a346b-43bf-11ea-85d8-48ba4e44ff52', '091970e2-43bf-11ea-85d8-48ba4e44ff52', 'SI', 0, 0),
('091aac8b-43bf-11ea-85d8-48ba4e44ff52', '091970e2-43bf-11ea-85d8-48ba4e44ff52', 'NO', 0, 0),
('0d115838-4575-11ea-85d8-48ba4e44ff52', '0d10c08d-4575-11ea-85d8-48ba4e44ff52', 'Estoy mucho peor de lo que pensaba', 1, 0),
('0d11dc6a-4575-11ea-85d8-48ba4e44ff52', '0d10c08d-4575-11ea-85d8-48ba4e44ff52', 'Estoy algo peor de lo que pensaba', 2, 0),
('0d147e12-4575-11ea-85d8-48ba4e44ff52', '0d10c08d-4575-11ea-85d8-48ba4e44ff52', 'Mis expectativas se cumplieron', 3, 0),
('0d14f4f6-4575-11ea-85d8-48ba4e44ff52', '0d10c08d-4575-11ea-85d8-48ba4e44ff52', 'Estoy un poco mejor de lo que pensaba', 4, 0),
('0d156b8d-4575-11ea-85d8-48ba4e44ff52', '0d10c08d-4575-11ea-85d8-48ba4e44ff52', 'Estoy mucho mejor de lo que pensaba', 5, 0),
('1fb94988-44a9-11ea-85d8-48ba4e44ff52', '1fb8c3bb-44a9-11ea-85d8-48ba4e44ff52', 'SI', 0, 0),
('1fb9ae03-44a9-11ea-85d8-48ba4e44ff52', '1fb8c3bb-44a9-11ea-85d8-48ba4e44ff52', 'NO', 0, 0),
('21d6a694-43bf-11ea-85d8-48ba4e44ff52', '21d5c5e4-43bf-11ea-85d8-48ba4e44ff52', 'ANTES DEL CIERRE', 0, 0),
('21d73be7-43bf-11ea-85d8-48ba4e44ff52', '21d5c5e4-43bf-11ea-85d8-48ba4e44ff52', 'DESPUES DEL CIERRE', 0, 0),
('24dd6d28-43be-11ea-85d8-48ba4e44ff52', '24dcb823-43be-11ea-85d8-48ba4e44ff52', 'LATERAL', 0, 0),
('24de15e2-43be-11ea-85d8-48ba4e44ff52', '24dcb823-43be-11ea-85d8-48ba4e44ff52', 'MEDIAL TRADICIONAL', 0, 0),
('24deae07-43be-11ea-85d8-48ba4e44ff52', '24dcb823-43be-11ea-85d8-48ba4e44ff52', 'MEDIAL MIDVASTO', 0, 0),
('24df5442-43be-11ea-85d8-48ba4e44ff52', '24dcb823-43be-11ea-85d8-48ba4e44ff52', 'MEDIAL SUBVASTO', 0, 0),
('2bff85aa-44a9-11ea-85d8-48ba4e44ff52', '2bfef27d-44a9-11ea-85d8-48ba4e44ff52', 'SI', 0, 0),
('2bfffc0f-44a9-11ea-85d8-48ba4e44ff52', '2bfef27d-44a9-11ea-85d8-48ba4e44ff52', 'NO', 0, 0),
('363d8bd3-44a9-11ea-85d8-48ba4e44ff52', '363cf8cc-44a9-11ea-85d8-48ba4e44ff52', 'SI', 0, 0),
('363e12a8-44a9-11ea-85d8-48ba4e44ff52', '363cf8cc-44a9-11ea-85d8-48ba4e44ff52', 'NO', 0, 0),
('3c8cbb53-463a-11ea-85d8-48ba4e44ff52', '3c8c1240-463a-11ea-85d8-48ba4e44ff52', 'Menor 10 grados', -5, 0),
('3c8d6b13-463a-11ea-85d8-48ba4e44ff52', '3c8c1240-463a-11ea-85d8-48ba4e44ff52', '11-20 grados', -10, 0),
('3c8dd680-463a-11ea-85d8-48ba4e44ff52', '3c8c1240-463a-11ea-85d8-48ba4e44ff52', 'Mayor 20 grados', -15, 0),
('414f75a1-452d-11ea-85d8-48ba4e44ff52', '414ea556-452d-11ea-85d8-48ba4e44ff52', 'Bartolomé L. Allende', 0, 0),
('415001dd-452d-11ea-85d8-48ba4e44ff52', '414ea556-452d-11ea-85d8-48ba4e44ff52', 'José Gómez', 0, 0),
('4150b495-452d-11ea-85d8-48ba4e44ff52', '414ea556-452d-11ea-85d8-48ba4e44ff52', 'Ignacio Pioli', 0, 0),
('415137d0-452d-11ea-85d8-48ba4e44ff52', '414ea556-452d-11ea-85d8-48ba4e44ff52', 'Mangupli Martín', 0, 0),
('4151d043-452d-11ea-85d8-48ba4e44ff52', '414ea556-452d-11ea-85d8-48ba4e44ff52', 'Santiago L. Iglesias', 0, 0),
('41753b73-43bd-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'NO', 0, 0),
('4175d513-43bd-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'ARTROSCOPIA', 0, 0),
('4176720b-43bd-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'MENISECTOMIA', 0, 0),
('41772344-43bd-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'OSTEOTOMIA TIBIO / FEMORAL', 0, 0),
('4177bd5a-43bd-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'RECONST LIGAMENTARIA', 0, 0),
('417861ce-43bd-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'RYO TIBIA', 0, 0),
('417918ab-43bd-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'RYO FEMUR', 0, 0),
('4179b1de-43bd-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'REEMPLAZO ARTICULAR DE RODILLA', 0, 0),
('4458adbc-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'AFLOJAMIENTO ASEPTICO', 0, 0),
('44596b82-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'OSTEOLISIS', 0, 0),
('445a1604-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'DESGASTE POLY', 0, 0),
('445abf20-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'DOLOR INEXPLICABLE', 0, 0),
('445b7fc6-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'AFLOJAMIENTO SEPTICO(ETAPA1 - ESPACIADOR)', 0, 0),
('445c127c-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'AFLOJAMIENTO SEPTICO(ETAPA 2 - REIMPLANTE)', 0, 0),
('445caf8b-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'RIGIDEZ', 0, 0),
('445d35c3-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'TOILETTE SIMPLE - INFECCION', 0, 0),
('445de645-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'FRACTURA PERIPROTESICA', 0, 0),
('445e7dbd-43bc-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', 'PROBLEMA PATELAR', 0, 0),
('4e883db1-44a4-11ea-85d8-48ba4e44ff52', '4e878f8f-44a4-11ea-85d8-48ba4e44ff52', 'FIJO', 0, 0),
('4e88ae2e-44a4-11ea-85d8-48ba4e44ff52', '4e878f8f-44a4-11ea-85d8-48ba4e44ff52', 'FLOJO', 0, 0),
('4e89117a-44a4-11ea-85d8-48ba4e44ff52', '4e878f8f-44a4-11ea-85d8-48ba4e44ff52', 'REVISADO', 0, 0),
('4e898f97-44a4-11ea-85d8-48ba4e44ff52', '4e878f8f-44a4-11ea-85d8-48ba4e44ff52', 'NO REVISADO', 0, 0),
('56ebcc03-44a4-11ea-85d8-48ba4e44ff52', '56eb3aaf-44a4-11ea-85d8-48ba4e44ff52', 'FIJO', 0, 0),
('56ec5775-44a4-11ea-85d8-48ba4e44ff52', '56eb3aaf-44a4-11ea-85d8-48ba4e44ff52', 'FLOJO', 0, 0),
('56ecc068-44a4-11ea-85d8-48ba4e44ff52', '56eb3aaf-44a4-11ea-85d8-48ba4e44ff52', 'REVISADO', 0, 0),
('56ed3c6b-44a4-11ea-85d8-48ba4e44ff52', '56eb3aaf-44a4-11ea-85d8-48ba4e44ff52', 'NO REVISADO', 0, 0),
('58ff7d51-43be-11ea-85d8-48ba4e44ff52', '58fed1a0-43be-11ea-85d8-48ba4e44ff52', 'NADA', 0, 0),
('59000217-43be-11ea-85d8-48ba4e44ff52', '58fed1a0-43be-11ea-85d8-48ba4e44ff52', 'CUADRICEPS SNIP', 0, 0),
('5900817c-43be-11ea-85d8-48ba4e44ff52', '58fed1a0-43be-11ea-85d8-48ba4e44ff52', 'OSTEOTOMIA TAT', 0, 0),
('5efb1f08-44a4-11ea-85d8-48ba4e44ff52', '5efaa0e3-44a4-11ea-85d8-48ba4e44ff52', 'FIJO', 0, 0),
('5efbaef7-44a4-11ea-85d8-48ba4e44ff52', '5efaa0e3-44a4-11ea-85d8-48ba4e44ff52', 'FLOJO', 0, 0),
('5efc1f9f-44a4-11ea-85d8-48ba4e44ff52', '5efaa0e3-44a4-11ea-85d8-48ba4e44ff52', 'REVISADO', 0, 0),
('5efc923c-44a4-11ea-85d8-48ba4e44ff52', '5efaa0e3-44a4-11ea-85d8-48ba4e44ff52', 'NO REVISADO', 0, 0),
('6033f1dc-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '0-5', 1, 0),
('60344f86-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '6-10', 2, 0),
('6034e3e2-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '11-15', 3, 0),
('60387307-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '16-20', 4, 0),
('6038f453-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '21-25', 5, 0),
('60394cb9-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '26-30', 6, 0),
('6039c862-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '31-35', 7, 0),
('603a3878-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '36-40', 8, 0),
('603aaa7d-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '41-45', 9, 0),
('603b2663-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '46-50', 10, 0),
('603bbcbc-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '51-55', 11, 0),
('603c2689-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '56-60', 12, 0),
('603cb604-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '61-65', 13, 0),
('60412f4b-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '66-70', 14, 0),
('6041a0b3-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '71-75', 15, 0),
('6041f4ef-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '76-80', 16, 0),
('60426769-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '81-85', 17, 0),
('6042e176-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '86-90', 18, 0),
('60436e7f-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '91-95', 19, 0),
('6043d95b-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '96-100', 20, 0),
('604457f0-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '101-105', 21, 0),
('6044b01b-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '106-110', 22, 0),
('60453167-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '111-115', 23, 0),
('6045a6d8-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '116-120', 24, 0),
('60462dd4-4636-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', '121-125', 25, 0),
('6047966f-44ab-11ea-85d8-48ba4e44ff52', '6046eb6e-44ab-11ea-85d8-48ba4e44ff52', 'TIPO 1. MINIMA PERDIDA STOCK OSEO', 0, 0),
('60480dcf-44ab-11ea-85d8-48ba4e44ff52', '6046eb6e-44ab-11ea-85d8-48ba4e44ff52', 'TIPO 2A. MEDIAL (PERDIDA OSEA SOLO CONDILO MEDIAL) O LATERAL', 0, 0),
('6048b2a2-44ab-11ea-85d8-48ba4e44ff52', '6046eb6e-44ab-11ea-85d8-48ba4e44ff52', 'TIPO 2B. PERDIDA OSEA DE AMBOS CONDILOS.', 0, 0),
('60494291-44ab-11ea-85d8-48ba4e44ff52', '6046eb6e-44ab-11ea-85d8-48ba4e44ff52', 'TIPO 3. SEVERA PERDIDA OSEA', 0, 0),
('630b786b-4578-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'Ninguno', 5, 0),
('630be689-4578-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'Leve', 4, 0),
('630c581f-4578-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'Moderado', 3, 0),
('630ce21c-4578-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'Severo', 2, 0),
('630d65fe-4578-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'Extremo', 1, 0),
('630e1a3a-4578-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'No lo pude hacer (por la rodilla)', 0, 0),
('630e7e19-4578-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'Nunca lo hice', 0, 0),
('672d91b7-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '0', 0, 0),
('672e20e3-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '1', 1, 0),
('672e9417-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '2', 2, 0),
('672ef55b-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '3', 3, 0),
('672f64b8-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '4', 4, 0),
('672fc7d2-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '5', 5, 0),
('67302351-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '6', 6, 0),
('6730981d-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '7', 7, 0),
('67332ab3-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '8', 8, 0),
('6733a896-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '9', 9, 0),
('67342a6d-4573-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', '10', 10, 0),
('6853c3d8-452d-11ea-85d8-48ba4e44ff52', '68531292-452d-11ea-85d8-48ba4e44ff52', 'Primaria', 0, 0),
('68545ca4-452d-11ea-85d8-48ba4e44ff52', '68531292-452d-11ea-85d8-48ba4e44ff52', 'Revisión', 0, 0),
('761c824c-4577-11ea-85d8-48ba4e44ff52', '761be88e-4577-11ea-85d8-48ba4e44ff52', 'Si', 0, 0),
('761cda05-4577-11ea-85d8-48ba4e44ff52', '761be88e-4577-11ea-85d8-48ba4e44ff52', 'No', 0, 0),
('8125c54b-43bd-11ea-85d8-48ba4e44ff52', '8124f187-43bd-11ea-85d8-48ba4e44ff52', 'CR', 0, 0),
('81268409-43bd-11ea-85d8-48ba4e44ff52', '8124f187-43bd-11ea-85d8-48ba4e44ff52', 'PS', 0, 0),
('8127308d-43bd-11ea-85d8-48ba4e44ff52', '8124f187-43bd-11ea-85d8-48ba4e44ff52', 'HIGHFLEX', 0, 0),
('8127d837-43bd-11ea-85d8-48ba4e44ff52', '8124f187-43bd-11ea-85d8-48ba4e44ff52', 'MOBILE BEARING', 0, 0),
('812874dd-43bd-11ea-85d8-48ba4e44ff52', '8124f187-43bd-11ea-85d8-48ba4e44ff52', 'CONSTRENIDO', 0, 0),
('812941ba-43bd-11ea-85d8-48ba4e44ff52', '8124f187-43bd-11ea-85d8-48ba4e44ff52', 'HINGE', 0, 0),
('8a9fe566-3d23-11ea-ba0e-48ba4e44ff52', '8a9f2a2c-3d23-11ea-ba0e-48ba4e44ff52', 'Derecha', 0, 0),
('8aa4fe97-3d23-11ea-ba0e-48ba4e44ff52', '8a9f2a2c-3d23-11ea-ba0e-48ba4e44ff52', 'Izquierda', 0, 0),
('8d263d14-43be-11ea-85d8-48ba4e44ff52', '8d2565b4-43be-11ea-85d8-48ba4e44ff52', 'FEMUR', 0, 0),
('8d26f4ff-43be-11ea-85d8-48ba4e44ff52', '8d2565b4-43be-11ea-85d8-48ba4e44ff52', 'TIBIA', 0, 0),
('8d2793b1-43be-11ea-85d8-48ba4e44ff52', '8d2565b4-43be-11ea-85d8-48ba4e44ff52', 'AMBOS', 0, 0),
('90636857-4635-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '1 - Ninguno', 50, 0),
('9063d132-4635-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '2 - Leve/Ocasional', 45, 0),
('906448e4-4635-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '3 - Solo escaleras', 40, 0),
('9064bdc4-4635-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '4 - Caminando y escaleras', 30, 0),
('90652f03-4635-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '5 - Moderada ocasional', 20, 0),
('90659991-4635-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '6 - Moderada continua', 10, 0),
('90660e21-4635-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '7 - Severo', 0, 0),
('9b52e43b-4574-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'Muy satisfecho', 8, 0),
('9b534b2b-4574-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'Satisfecho', 6, 0),
('9b53b81b-4574-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'Neutral', 4, 0),
('9b54308b-4574-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'Insatisfecho', 2, 0),
('9b54b4ff-4574-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'Muy insatisfecho', 0, 0),
('a7aabd9c-4573-11ea-85d8-48ba4e44ff52', 'a7a9ea45-4573-11ea-85d8-48ba4e44ff52', 'Siempre', 5, 0),
('a7ab2e0c-4573-11ea-85d8-48ba4e44ff52', 'a7a9ea45-4573-11ea-85d8-48ba4e44ff52', 'A veces', 3, 0),
('a7abb237-4573-11ea-85d8-48ba4e44ff52', 'a7a9ea45-4573-11ea-85d8-48ba4e44ff52', 'Nunca', 0, 0),
('a8f2e128-4636-11ea-85d8-48ba4e44ff52', 'a8f251b8-4636-11ea-85d8-48ba4e44ff52', 'Menor a 5 mm', 10, 0),
('a8f36326-4636-11ea-85d8-48ba4e44ff52', 'a8f251b8-4636-11ea-85d8-48ba4e44ff52', '5-10 mm', 5, 0),
('a8f3df8d-4636-11ea-85d8-48ba4e44ff52', 'a8f251b8-4636-11ea-85d8-48ba4e44ff52', 'Mayor a 10 mm', 0, 0),
('ab9d7ed2-43be-11ea-85d8-48ba4e44ff52', 'ab9ca988-43be-11ea-85d8-48ba4e44ff52', 'VARO', 0, 0),
('ab9e2aeb-43be-11ea-85d8-48ba4e44ff52', 'ab9ca988-43be-11ea-85d8-48ba4e44ff52', 'VALGO', 0, 0),
('b07332c0-452d-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', 'Pre-operatoria', 0, 0),
('b073c07a-452d-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', '3 meses', 0, 0),
('b077dd81-452d-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', '1 año', 0, 0),
('b078787e-452d-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', '5 años', 0, 0),
('b07902cc-452d-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', '10 años', 0, 0),
('b0799492-452d-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', '15 años', 0, 0),
('b07a167d-452d-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', 'Mas de 15 años', 0, 0),
('b2463ea7-4577-11ea-85d8-48ba4e44ff52', 'b2459ec4-4577-11ea-85d8-48ba4e44ff52', 'Silla de Ruedas', -10, 0),
('b246caa8-4577-11ea-85d8-48ba4e44ff52', 'b2459ec4-4577-11ea-85d8-48ba4e44ff52', 'Caminador', -8, 0),
('b2472bc5-4577-11ea-85d8-48ba4e44ff52', 'b2459ec4-4577-11ea-85d8-48ba4e44ff52', 'Muletas', -6, 0),
('b24808f5-4577-11ea-85d8-48ba4e44ff52', 'b2459ec4-4577-11ea-85d8-48ba4e44ff52', 'Un bastón', -4, 0),
('b24a9935-4577-11ea-85d8-48ba4e44ff52', 'b2459ec4-4577-11ea-85d8-48ba4e44ff52', 'Rodillera', -2, 0),
('c020f17b-43bb-11ea-85d8-48ba4e44ff52', 'c01f7a14-43bb-11ea-85d8-48ba4e44ff52', 'OA', 0, 0),
('c0219827-43bb-11ea-85d8-48ba4e44ff52', 'c01f7a14-43bb-11ea-85d8-48ba4e44ff52', 'AR', 0, 0),
('c02261fd-43bb-11ea-85d8-48ba4e44ff52', 'c01f7a14-43bb-11ea-85d8-48ba4e44ff52', 'NAV', 0, 0),
('c022f9b3-43bb-11ea-85d8-48ba4e44ff52', 'c01f7a14-43bb-11ea-85d8-48ba4e44ff52', 'POST-TX', 0, 0),
('c0239f9b-43bb-11ea-85d8-48ba4e44ff52', 'c01f7a14-43bb-11ea-85d8-48ba4e44ff52', 'FX PATO', 0, 0),
('c0243c11-43bb-11ea-85d8-48ba4e44ff52', 'c01f7a14-43bb-11ea-85d8-48ba4e44ff52', 'TUMOR', 0, 0),
('c5605537-43bd-11ea-85d8-48ba4e44ff52', 'c55f81ff-43bd-11ea-85d8-48ba4e44ff52', 'AUTOLOGO', 0, 0),
('c561267f-43bd-11ea-85d8-48ba4e44ff52', 'c55f81ff-43bd-11ea-85d8-48ba4e44ff52', 'INJERTO OSEO ESTRUCTURAL', 0, 0),
('c561bb52-43bd-11ea-85d8-48ba4e44ff52', 'c55f81ff-43bd-11ea-85d8-48ba4e44ff52', 'INJERTO OSEO CHIPS', 0, 0),
('c5625521-43bd-11ea-85d8-48ba4e44ff52', 'c55f81ff-43bd-11ea-85d8-48ba4e44ff52', 'SUSTITUTO OSEO', 0, 0),
('cb5299a3-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '0 grados', -15, 0),
('cb5319a0-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '1 grados', -12, 0),
('cb538df3-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '2 grados', -9, 0),
('cb53e400-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '3 grados', -6, 0),
('cb5468fb-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '4 grados', -3, 0),
('cb54e65e-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '5-10 grados', 0, 0),
('cb555dab-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '11 grados', -3, 0),
('cb55d0f7-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '12 grados', -6, 0),
('cb566ce2-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '13 grados', -9, 0),
('cb56ecff-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '14 grados', -12, 0),
('cb5badf7-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '15 grados', -15, 0),
('cb5c28a8-463c-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', 'Mayor a 15 grados', -20, 0),
('ce2c0812-43be-11ea-85d8-48ba4e44ff52', 'ce2b5be7-43be-11ea-85d8-48ba4e44ff52', 'SI', 0, 0),
('ce2c87cf-43be-11ea-85d8-48ba4e44ff52', 'ce2b5be7-43be-11ea-85d8-48ba4e44ff52', 'NO', 0, 0),
('ce991d30-3d1e-11ea-ba0e-48ba4e44ff52', 'ce986650-3d1e-11ea-ba0e-48ba4e44ff52', 'BLA', 0, 0),
('ce99aa92-3d1e-11ea-ba0e-48ba4e44ff52', 'ce986650-3d1e-11ea-ba0e-48ba4e44ff52', 'JG', 0, 0),
('ce9a6ae1-3d1e-11ea-ba0e-48ba4e44ff52', 'ce986650-3d1e-11ea-ba0e-48ba4e44ff52', 'IP', 0, 0),
('ce9b309a-3d1e-11ea-ba0e-48ba4e44ff52', 'ce986650-3d1e-11ea-ba0e-48ba4e44ff52', 'MM', 0, 0),
('ce9bcc74-3d1e-11ea-ba0e-48ba4e44ff52', 'ce986650-3d1e-11ea-ba0e-48ba4e44ff52', 'SI', 0, 0),
('cf98de11-2faa-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', 'NINGUNO', 0, 0),
('cf9c6741-2faa-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', 'LEVE', 1, 0),
('cfa01f07-2faa-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', 'MODERADO', 2, 0),
('cfa7c196-2faa-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', 'SEVERO', 3, 0),
('cfafabbe-2faa-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', 'EXTREMO', 4, 0),
('d98ac029-4638-11ea-85d8-48ba4e44ff52', 'd989fae7-4638-11ea-85d8-48ba4e44ff52', 'Menor a 5 mm', 15, 0),
('d98b55e2-4638-11ea-85d8-48ba4e44ff52', 'd989fae7-4638-11ea-85d8-48ba4e44ff52', '6-9 mm', 10, 0),
('d98bd474-4638-11ea-85d8-48ba4e44ff52', 'd989fae7-4638-11ea-85d8-48ba4e44ff52', '10-14mm', 5, 0),
('d98c5226-4638-11ea-85d8-48ba4e44ff52', 'd989fae7-4638-11ea-85d8-48ba4e44ff52', 'Mayor a 15 mm', 0, 0),
('de09c250-43be-11ea-85d8-48ba4e44ff52', 'de09021b-43be-11ea-85d8-48ba4e44ff52', 'SI', 0, 0),
('de0a7159-43be-11ea-85d8-48ba4e44ff52', 'de09021b-43be-11ea-85d8-48ba4e44ff52', 'NO', 0, 0),
('e5bed56f-44a8-11ea-85d8-48ba4e44ff52', 'e5be102b-44a8-11ea-85d8-48ba4e44ff52', 'CEMENTADO', 0, 0),
('e5c15953-44a8-11ea-85d8-48ba4e44ff52', 'e5be102b-44a8-11ea-85d8-48ba4e44ff52', 'NO CEMENTADO', 0, 0),
('eb458c98-43be-11ea-85d8-48ba4e44ff52', 'eb44e3b7-43be-11ea-85d8-48ba4e44ff52', 'SI', 0, 0),
('eb462d52-43be-11ea-85d8-48ba4e44ff52', 'eb44e3b7-43be-11ea-85d8-48ba4e44ff52', 'NO', 0, 0),
('f62c9271-4253-11ea-ba0e-48ba4e44ff52', 'f62ba336-4253-11ea-ba0e-48ba4e44ff52', 'PRIMARIA', 0, 0),
('f62dc91d-4253-11ea-ba0e-48ba4e44ff52', 'f62ba336-4253-11ea-ba0e-48ba4e44ff52', 'UNI', 0, 0),
('f62e8792-4253-11ea-ba0e-48ba4e44ff52', 'f62ba336-4253-11ea-ba0e-48ba4e44ff52', 'PATELLO-FEMORAL', 0, 0),
('f62f0fe7-4253-11ea-ba0e-48ba4e44ff52', 'f62ba336-4253-11ea-ba0e-48ba4e44ff52', 'REVISION 1', 0, 0),
('f62fd11a-4253-11ea-ba0e-48ba4e44ff52', 'f62ba336-4253-11ea-ba0e-48ba4e44ff52', 'REVISION 2', 0, 0),
('f63076e4-4253-11ea-ba0e-48ba4e44ff52', 'f62ba336-4253-11ea-ba0e-48ba4e44ff52', '10 AÑOS', 0, 0),
('fa494c0f-4577-11ea-85d8-48ba4e44ff52', 'fa48bfc3-4577-11ea-85d8-48ba4e44ff52', 'No lo puedo soportar', 0, 0),
('fa49cc6a-4577-11ea-85d8-48ba4e44ff52', 'fa48bfc3-4577-11ea-85d8-48ba4e44ff52', '0-5 minutos', 3, 0),
('fa4a4338-4577-11ea-85d8-48ba4e44ff52', 'fa48bfc3-4577-11ea-85d8-48ba4e44ff52', '6-15 minutos', 6, 0),
('fa4aa88a-4577-11ea-85d8-48ba4e44ff52', 'fa48bfc3-4577-11ea-85d8-48ba4e44ff52', '16-30 minutos', 9, 0),
('fa4b0483-4577-11ea-85d8-48ba4e44ff52', 'fa48bfc3-4577-11ea-85d8-48ba4e44ff52', '31-60 minutos', 12, 0),
('fa4b7433-4577-11ea-85d8-48ba4e44ff52', 'fa48bfc3-4577-11ea-85d8-48ba4e44ff52', 'Mas de 1 hora', 15, 0);

--
-- Disparadores `answer`
--
DELIMITER $$
CREATE TRIGGER `answer_GUID` BEFORE INSERT ON `answer` FOR EACH ROW begin
 SET new.idanswer = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detail_type_of_procedure`
--

CREATE TABLE `detail_type_of_procedure` (
  `iddetail_type_of_procedure` varchar(60) NOT NULL,
  `idtype_of_procedure` varchar(60) NOT NULL,
  `detail` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detail_type_of_procedure`
--

INSERT INTO `detail_type_of_procedure` (`iddetail_type_of_procedure`, `idtype_of_procedure`, `detail`, `description`, `erased`) VALUES
('6791e5e6-2fa6-11ea-9402-ac220b26bfde', '19868bd9-2fa6-11ea-9402-ac220b26bfde', 'Apendicectomía', 'La apendicectomía es la técnica quirúrgica por medio de la cual se extrae el apéndice (apéndice cecal, vermiforme o vermicular), habitualmente en casos de apendicitis aguda', 0),
('6ffd254b-2fa6-11ea-9402-ac220b26bfde', '19868bd9-2fa6-11ea-9402-ac220b26bfde', 'Artroplastia de rodilla', 'En la artroplastia de rodilla , los médicos extraen el cartílago dañado y lo reemplazan con nuevas superficies articulares en un proceso por pasos.', 0),
('7bc69344-2fa6-11ea-9402-ac220b26bfde', '210881cc-2fa6-11ea-9402-ac220b26bfde', 'Swan Ganz', 'procedimiento médico en el que se pasa una sonda delgada hasta el lado derecho del corazón con el fin de monitorizar el paso de sangre a través del corazón y vigilar la función cardíaca en pacientes muy enfermos.', 0),
('81304a7f-2fa6-11ea-9402-ac220b26bfde', '210881cc-2fa6-11ea-9402-ac220b26bfde', 'Coronariografía', 'Proceso de diagnóstico por imagen cuya función es el estudio de los vasos que nutren al miocardio (músculo cardíaco) que no son visibles mediante la radiología convencional.', 0),
('c204c1e6-4c03-11ea-9d7a-48ba4e44ff52', '19868bd9-2fa6-11ea-9402-ac220b26bfde', 'Reemplazo de Cadera', 'Procedimiento de Reemplazo de Cadera Total o Parcial.', 0);

--
-- Disparadores `detail_type_of_procedure`
--
DELIMITER $$
CREATE TRIGGER `detail_type_of_procedure_GUID` BEFORE INSERT ON `detail_type_of_procedure` FOR EACH ROW begin
 SET new.iddetail_type_of_procedure = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empty_poll`
--

CREATE TABLE `empty_poll` (
  `idempty_poll` varchar(60) NOT NULL,
  `iddetail_type_of_procedure` varchar(60) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(145) NOT NULL,
  `type` varchar(45) NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empty_poll`
--

INSERT INTO `empty_poll` (`idempty_poll`, `iddetail_type_of_procedure`, `name`, `description`, `type`, `create_date`, `erased`) VALUES
('05b01568-2fa7-11ea-9402-ac220b26bfde', '6ffd254b-2fa6-11ea-9402-ac220b26bfde', 'WOMAC SCORE', 'REEMPLAZO ARTICULAR DE RODILLA', 'Score', '2020-01-05 10:34:58', 0),
('1da57156-2fa7-11ea-9402-ac220b26bfde', '6ffd254b-2fa6-11ea-9402-ac220b26bfde', 'KNEE SOCIETY SCORE – PACIENTE', '(PARA SER COMPLETADO POR EL PACIENTE)', 'Score', '2020-01-05 10:35:39', 0),
('219a9f8e-2fa7-11ea-9402-ac220b26bfde', '6ffd254b-2fa6-11ea-9402-ac220b26bfde', 'KNEE SOCIETY SCORE – POSTQUIRÚRGICO', '(PARA SER COMPLETADO POR EL MÉDICO)', 'Score', '2020-01-05 10:35:45', 0),
('2d5bd8cb-4c04-11ea-9d7a-48ba4e44ff52', 'c204c1e6-4c03-11ea-9d7a-48ba4e44ff52', 'Harris Hip Score', 'Reemplazo Articular de Cadera', '1', '2020-02-10 12:52:15', 0),
('b2e27a69-3ccc-11ea-ba0e-48ba4e44ff52', '6ffd254b-2fa6-11ea-9402-ac220b26bfde', 'EVALUACION INTRAOPERATORIA', 'REEMPLAZO ARTICULAR DE RODILLA', 'Score', '2020-01-22 04:07:21', 0),
('c4c1c8ab-4b83-11ea-966b-48ba4e44ff52', '6791e5e6-2fa6-11ea-9402-ac220b26bfde', 'Apache 2', 'Prueba', '1', '2020-02-09 21:46:51', 0),
('d675c7ad-2fa6-11ea-9402-ac220b26bfde', '6791e5e6-2fa6-11ea-9402-ac220b26bfde', 'WOMAC SCORE', 'REEMPLAZO ARTICULAR DE RODILLA', 'Score', '2020-01-05 10:34:41', 1);

--
-- Disparadores `empty_poll`
--
DELIMITER $$
CREATE TRIGGER `empty_poll_GUID` BEFORE INSERT ON `empty_poll` FOR EACH ROW begin
 SET new.idempty_poll = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institution`
--

CREATE TABLE `institution` (
  `idinstitution` varchar(60) NOT NULL,
  `name` varchar(45) NOT NULL,
  `display_name` varchar(45) DEFAULT NULL,
  `country` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `direction` varchar(45) NOT NULL,
  `type_of_establishment` varchar(45) DEFAULT NULL,
  `description` varchar(145) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `institution`
--

INSERT INTO `institution` (`idinstitution`, `name`, `display_name`, `country`, `state`, `city`, `direction`, `type_of_establishment`, `description`, `erased`) VALUES
('3ee639e3-3030-11ea-9402-ac220b26bfde', 'Sanatorio Allende', 'Sanatorio Allende Nueva Córdoba', 'Argentina', 'Cordoba', 'Cordoba', 'Av. Hipólito Yrigoyen 384', '', '', 0),
('4137ec07-3030-11ea-9402-ac220b26bfde', 'Sanatorio Allende', 'Sanatorio Allende Nueva Córdoba', 'Argentina', 'Cordoba', 'Cordoba', 'Av. Hipólito Yrigoyen 384', '', '', 1),
('52659f9a-3030-11ea-9402-ac220b26bfde', 'Hospital Italiano', 'Hospital Italiano Sociedad de Beneficencia', 'Argentina', 'Cordoba', 'Cordoba', 'Roma 550', '', '', 1);

--
-- Disparadores `institution`
--
DELIMITER $$
CREATE TRIGGER `institution_GUID` BEFORE INSERT ON `institution` FOR EACH ROW begin
 SET new.idinstitution = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient`
--

CREATE TABLE `patient` (
  `idpatient` varchar(60) NOT NULL,
  `idperson` varchar(60) NOT NULL,
  `notes` varchar(140) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `patient`
--

INSERT INTO `patient` (`idpatient`, `idperson`, `notes`, `email`, `erased`) VALUES
('041fd2da-3cbd-11ea-ba0e-48ba4e44ff52', '041f4e30-3cbd-11ea-ba0e-48ba4e44ff52', NULL, NULL, 0),
('15a22b80-3034-11ea-9402-ac220b26bfde', '15842920-3034-11ea-9402-ac220b26bfde', 'El paciente tiene antecedentes de diabetes', 'micachuela_cvr@gmail.com', 0),
('7982f0bd-3034-11ea-9402-ac220b26bfde', '7975368c-3034-11ea-9402-ac220b26bfde', 'El paciente tiene antecedentes de artrosis', 'ecabanilla@gmail.com', 0),
('84e07329-3033-11ea-9402-ac220b26bfde', '84c4be20-3033-11ea-9402-ac220b26bfde', 'Hipertension', 'pp.cabanilla@gmail.com', 0),
('b77b5569-3cbc-11ea-ba0e-48ba4e44ff52', '04d1d31d-3bf0-11ea-9f3e-48ba4e44ff52', NULL, NULL, 0);

--
-- Disparadores `patient`
--
DELIMITER $$
CREATE TRIGGER `patient_GUID` BEFORE INSERT ON `patient` FOR EACH ROW begin
 SET new.idpatient = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `idpermissions` varchar(60) NOT NULL,
  `permissionscol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `idperson` varchar(60) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `birth_date` varchar(10) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`idperson`, `dni`, `birth_date`, `sex`, `first_name`, `last_name`, `erased`) VALUES
('041f4e30-3cbd-11ea-ba0e-48ba4e44ff52', '123456', '23/04/1988', 'Masculino', 'Miguel', 'Avalos', 0),
('04d1d31d-3bf0-11ea-9f3e-48ba4e44ff52', '33694598', '1988-04-25', 'Masculino', 'Pablo', 'Sarmiento', 0),
('15842920-3034-11ea-9402-ac220b26bfde', '40385210', '14/11/1997', 'FEMENINO', 'Micaela', 'cabanilla', 0),
('6442eceb-48e0-11ea-85d8-48ba4e44ff52', '1651651616', '1988-01-25', 'Masculino', 'Pablo', 'Sarmiento', 1),
('6701483e-2f9f-11ea-9402-ac220b26bfde', '371958752', '09-01-1993', 'MASCULINO', 'federico', 'Cabanilla', 1),
('7975368c-3034-11ea-9402-ac220b26bfde', '18015888', '11/11/1997', 'FEMENINO', 'Edith', 'Cabanilla', 0),
('84c4be20-3033-11ea-9402-ac220b26bfde', '16906739', '14/11/1997', 'MASCULINO', 'Jose Luis', 'Cabanilla', 0),
('aa1fa286-3031-11ea-9402-ac220b26bfde', '40385210', '14/11/1997', 'FEMENINO', 'Micaela', 'cabanilla', 0),
('aeb64603-3031-11ea-9402-ac220b26bfde', '40385210', '14/11/1997', 'FEMENINO', 'Micaela', 'cabanilla', 0),
('b77a57ad-3cbc-11ea-ba0e-48ba4e44ff52', '33694598', '25/04/1988', 'Masculino', 'Pablo', 'Sarmiento', 0),
('cd7663ab-3035-11ea-9402-ac220b26bfde', '37195387', '09/01/1993', 'MASCULINO', 'federico', 'cabanilla', 1),
('edadc574-4acf-11ea-966b-48ba4e44ff52', '37195387', '09/01/1993', 'MASCULINO', 'federico', 'cabanilla', 0);

--
-- Disparadores `person`
--
DELIMITER $$
CREATE TRIGGER `person_GUID` BEFORE INSERT ON `person` FOR EACH ROW begin
 SET new.idperson = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poll`
--

CREATE TABLE `poll` (
  `idpoll` varchar(60) NOT NULL COMMENT '	',
  `iduser_author` varchar(60) NOT NULL,
  `idtype_of_poll` varchar(60) NOT NULL,
  `idempty_poll` varchar(60) NOT NULL,
  `idprocedure` varchar(60) DEFAULT NULL,
  `description` varchar(60) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `poll`
--

INSERT INTO `poll` (`idpoll`, `iduser_author`, `idtype_of_poll`, `idempty_poll`, `idprocedure`, `description`, `create_date`, `erased`) VALUES
('22a6e4e3-48df-11ea-85d8-48ba4e44ff52', '04d340ab-3bf0-11ea-9f3e-48ba4e44ff52', '374123cb-3c00-11ea-9f3e-48ba4e44ff52', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'd146baa3-3cc0-11ea-ba0e-48ba4e44ff52', 'REEMPLAZO ARTICULAR DE RODILLA', '2020-02-06 12:49:05', 0),
('271de558-489a-11ea-85d8-48ba4e44ff52', '04d340ab-3bf0-11ea-9f3e-48ba4e44ff52', '374123cb-3c00-11ea-9f3e-48ba4e44ff52', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'd146baa3-3cc0-11ea-ba0e-48ba4e44ff52', 'REEMPLAZO ARTICULAR DE RODILLA', '2020-02-06 04:35:24', 0),
('5ddc0f81-3c08-11ea-ba0e-48ba4e44ff52', 'c1f1d5de-3a64-11ea-8f17-48ba4e44ff52', '374123cb-3c00-11ea-9f3e-48ba4e44ff52', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'ba9f80a2-305e-11ea-9402-ac220b26bfde', 'REEMPLAZO ARTICULAR DE RODILLA', '2020-01-21 12:35:54', 1),
('92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 'c1f1d5de-3a64-11ea-8f17-48ba4e44ff52', '374123cb-3c00-11ea-9f3e-48ba4e44ff52', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'ba9f80a2-305e-11ea-9402-ac220b26bfde', 'REEMPLAZO ARTICULAR DE RODILLA', '2020-01-21 12:39:52', 1),
('98b9ffa2-3079-11ea-9402-ac220b26bfde', 'pendiente', '4b838099-306a-11ea-9402-ac220b26bfde', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'ba9f80a2-305e-11ea-9402-ac220b26bfde', 'Descripcion de una Poll de prueba del POST', '2020-01-06 11:42:19', 0),
('9d743f78-3cbf-11ea-ba0e-48ba4e44ff52', '04d340ab-3bf0-11ea-9f3e-48ba4e44ff52', '374123cb-3c00-11ea-9f3e-48ba4e44ff52', '05b01568-2fa7-11ea-9402-ac220b26bfde', '6135eb65-3cbe-11ea-ba0e-48ba4e44ff52', 'REEMPLAZO ARTICULAR DE RODILLA', '2020-01-22 02:33:41', 0),
('a13b9d59-3079-11ea-9402-ac220b26bfde', 'pendiente', '4b838099-306a-11ea-9402-ac220b26bfde', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'ba9f80a2-305e-11ea-9402-ac220b26bfde', 'Descripcion de una Poll de prueba del POST', '2020-01-21 12:39:56', 1),
('a498a6ab-3079-11ea-9402-ac220b26bfde', 'pendiente', '4b838099-306a-11ea-9402-ac220b26bfde', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'ba9f80a2-305e-11ea-9402-ac220b26bfde', 'Descripcion de una Poll de prueba del POST', '2020-01-21 12:36:58', 1),
('efe64e51-3bef-11ea-9f3e-48ba4e44ff52', 'c1f1d5de-3a64-11ea-8f17-48ba4e44ff52', '4dcecc11-3b14-11ea-9f3e-48ba4e44ff52', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'ba9f80a2-305e-11ea-9402-ac220b26bfde', 'REEMPLAZO ARTICULAR DE RODILLA', '2020-01-21 12:37:42', 1);

--
-- Disparadores `poll`
--
DELIMITER $$
CREATE TRIGGER `poll_GUID` BEFORE INSERT ON `poll` FOR EACH ROW begin
 SET new.idpoll = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poll_detail`
--

CREATE TABLE `poll_detail` (
  `idpoll_detail` varchar(60) NOT NULL,
  `idquestion` varchar(60) NOT NULL,
  `idanswer` varchar(60) NOT NULL,
  `idpoll` varchar(60) NOT NULL,
  `erased` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `poll_detail`
--

INSERT INTO `poll_detail` (`idpoll_detail`, `idquestion`, `idanswer`, `idpoll`, `erased`) VALUES
('22a86d4b-48df-11ea-85d8-48ba4e44ff52', 'ee8bf938-2fac-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '22a6e4e3-48df-11ea-85d8-48ba4e44ff52', 0),
('22a91cb8-48df-11ea-85d8-48ba4e44ff52', 'e18bc2ae-2fac-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '22a6e4e3-48df-11ea-85d8-48ba4e44ff52', 0),
('22a9ffa8-48df-11ea-85d8-48ba4e44ff52', '5b63c66f-2fad-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '22a6e4e3-48df-11ea-85d8-48ba4e44ff52', 0),
('22aab9e5-48df-11ea-85d8-48ba4e44ff52', '665a61a2-2fad-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '22a6e4e3-48df-11ea-85d8-48ba4e44ff52', 0),
('271f198e-489a-11ea-85d8-48ba4e44ff52', '2450a948-2fab-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '271de558-489a-11ea-85d8-48ba4e44ff52', 0),
('271febec-489a-11ea-85d8-48ba4e44ff52', '1b168aaa-2fab-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '271de558-489a-11ea-85d8-48ba4e44ff52', 0),
('3742f419-3c00-11ea-9f3e-48ba4e44ff52', 'f1ca5029-2faa-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '3742003d-3c00-11ea-9f3e-48ba4e44ff52', 0),
('3743f674-3c00-11ea-9f3e-48ba4e44ff52', '0354809a-2fab-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '3742003d-3c00-11ea-9f3e-48ba4e44ff52', 0),
('5ddd3874-3c08-11ea-ba0e-48ba4e44ff52', 'f1ca5029-2faa-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '5ddc0f81-3c08-11ea-ba0e-48ba4e44ff52', 0),
('92f7a2f2-3c00-11ea-9f3e-48ba4e44ff52', 'f1ca5029-2faa-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92f87a40-3c00-11ea-9f3e-48ba4e44ff52', '0354809a-2fab-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92f93395-3c00-11ea-9f3e-48ba4e44ff52', '0ccf69e2-2fab-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92f9d223-3c00-11ea-9f3e-48ba4e44ff52', '1b168aaa-2fab-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92faacd7-3c00-11ea-9f3e-48ba4e44ff52', '2450a948-2fab-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92fb73fc-3c00-11ea-9f3e-48ba4e44ff52', 'add2dc51-2fac-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92fc22e8-3c00-11ea-9f3e-48ba4e44ff52', 'c0f6873e-2fac-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92fcdeca-3c00-11ea-9f3e-48ba4e44ff52', 'e18bc2ae-2fac-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92fd8091-3c00-11ea-9f3e-48ba4e44ff52', 'ee8bf938-2fac-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92fe3826-3c00-11ea-9f3e-48ba4e44ff52', '5b63c66f-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92fef92e-3c00-11ea-9f3e-48ba4e44ff52', '665a61a2-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('92ffc66a-3c00-11ea-9f3e-48ba4e44ff52', '6e259dd2-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('93007a39-3c00-11ea-9f3e-48ba4e44ff52', '778a61e9-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('93014620-3c00-11ea-9f3e-48ba4e44ff52', '7fedfe37-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('93020556-3c00-11ea-9f3e-48ba4e44ff52', '85db2e39-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('9302c1a3-3c00-11ea-9f3e-48ba4e44ff52', '8c599616-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('9303775a-3c00-11ea-9f3e-48ba4e44ff52', '92264838-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('93043df9-3c00-11ea-9f3e-48ba4e44ff52', '9894ca0f-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('9304feaf-3c00-11ea-9f3e-48ba4e44ff52', '9d89d324-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('9305b721-3c00-11ea-9f3e-48ba4e44ff52', 'a5840b21-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('9306853c-3c00-11ea-9f3e-48ba4e44ff52', 'aabdd8e2-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('930757a4-3c00-11ea-9f3e-48ba4e44ff52', 'b3bb6ef6-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('930817bb-3c00-11ea-9f3e-48ba4e44ff52', 'bb06b968-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('9308c780-3c00-11ea-9f3e-48ba4e44ff52', 'c19aa900-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '92f6cf22-3c00-11ea-9f3e-48ba4e44ff52', 0),
('98c04c3b-3079-11ea-9402-ac220b26bfde', 'f1ca5029-2faa-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98c3d993-3079-11ea-9402-ac220b26bfde', '0354809a-2fab-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98c7c31d-3079-11ea-9402-ac220b26bfde', '0ccf69e2-2fab-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98cf3fa2-3079-11ea-9402-ac220b26bfde', '1b168aaa-2fab-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98d6d862-3079-11ea-9402-ac220b26bfde', '2450a948-2fab-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98dadd7c-3079-11ea-9402-ac220b26bfde', 'add2dc51-2fac-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98de8e42-3079-11ea-9402-ac220b26bfde', 'c0f6873e-2fac-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98e27cd8-3079-11ea-9402-ac220b26bfde', 'e18bc2ae-2fac-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98e62d3a-3079-11ea-9402-ac220b26bfde', 'ee8bf938-2fac-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98ea26d4-3079-11ea-9402-ac220b26bfde', '5b63c66f-2fad-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98edd0eb-3079-11ea-9402-ac220b26bfde', '665a61a2-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98f1c0b3-3079-11ea-9402-ac220b26bfde', '6e259dd2-2fad-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98f57b2c-3079-11ea-9402-ac220b26bfde', '778a61e9-2fad-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98f96a60-3079-11ea-9402-ac220b26bfde', '7fedfe37-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('98fd0c7d-3079-11ea-9402-ac220b26bfde', '85db2e39-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('9901166c-3079-11ea-9402-ac220b26bfde', '8c599616-2fad-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('9904c98c-3079-11ea-9402-ac220b26bfde', '92264838-2fad-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('9908c160-3079-11ea-9402-ac220b26bfde', '9894ca0f-2fad-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('990c587c-3079-11ea-9402-ac220b26bfde', '9d89d324-2fad-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('9910462e-3079-11ea-9402-ac220b26bfde', 'a5840b21-2fad-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('99144aa0-3079-11ea-9402-ac220b26bfde', 'aabdd8e2-2fad-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('9917f7a2-3079-11ea-9402-ac220b26bfde', 'b3bb6ef6-2fad-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('991bb1ad-3079-11ea-9402-ac220b26bfde', 'bb06b968-2fad-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('991f9dc0-3079-11ea-9402-ac220b26bfde', 'c19aa900-2fad-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '98b9ffa2-3079-11ea-9402-ac220b26bfde', 0),
('9d7512ed-3cbf-11ea-ba0e-48ba4e44ff52', 'f1ca5029-2faa-11ea-9402-ac220b26bfde', 'cfafabbe-2faa-11ea-9402-ac220b26bfde', '9d743f78-3cbf-11ea-ba0e-48ba4e44ff52', 0),
('9d75ad7f-3cbf-11ea-ba0e-48ba4e44ff52', '0354809a-2fab-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '9d743f78-3cbf-11ea-ba0e-48ba4e44ff52', 0),
('9d760fb2-3cbf-11ea-ba0e-48ba4e44ff52', '0ccf69e2-2fab-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '9d743f78-3cbf-11ea-ba0e-48ba4e44ff52', 0),
('9d7699b0-3cbf-11ea-ba0e-48ba4e44ff52', '1b168aaa-2fab-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '9d743f78-3cbf-11ea-ba0e-48ba4e44ff52', 0),
('9d7718a8-3cbf-11ea-ba0e-48ba4e44ff52', '2450a948-2fab-11ea-9402-ac220b26bfde', 'cfa7c196-2faa-11ea-9402-ac220b26bfde', '9d743f78-3cbf-11ea-ba0e-48ba4e44ff52', 0),
('efe996ca-3bef-11ea-9f3e-48ba4e44ff52', 'f1ca5029-2faa-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0),
('efe999a2-3bef-11ea-9f3e-48ba4e44ff52', '0354809a-2fab-11ea-9402-ac220b26bfde', 'cf98de11-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0),
('efe99a40-3bef-11ea-9f3e-48ba4e44ff52', '0ccf69e2-2fab-11ea-9402-ac220b26bfde', 'cf9c6741-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0),
('efe99aa9-3bef-11ea-9f3e-48ba4e44ff52', '1b168aaa-2fab-11ea-9402-ac220b26bfde', 'cf9c6741-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0),
('efe99b57-3bef-11ea-9f3e-48ba4e44ff52', '2450a948-2fab-11ea-9402-ac220b26bfde', 'cfa01f07-2faa-11ea-9402-ac220b26bfde', '0020d7ee-3b15-11ea-9f3e-48ba4e44ff52', 0);

--
-- Disparadores `poll_detail`
--
DELIMITER $$
CREATE TRIGGER `poll_detail_GUID` BEFORE INSERT ON `poll_detail` FOR EACH ROW begin
 SET new.idpoll_detail = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimiento`
--

CREATE TABLE `procedimiento` (
  `idprocedure` varchar(60) NOT NULL,
  `idinstitution` varchar(60) NOT NULL,
  `idservice` varchar(60) NOT NULL,
  `iddetail_type_of_procedure` varchar(60) NOT NULL,
  `idpatient` varchar(60) NOT NULL,
  `iduser` varchar(60) NOT NULL,
  `description` varchar(145) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `procedimiento`
--

INSERT INTO `procedimiento` (`idprocedure`, `idinstitution`, `idservice`, `iddetail_type_of_procedure`, `idpatient`, `iduser`, `description`, `date`, `erased`) VALUES
('6135eb65-3cbe-11ea-ba0e-48ba4e44ff52', '3ee639e3-3030-11ea-9402-ac220b26bfde', '607c0304-3031-11ea-9402-ac220b26bfde', '6791e5e6-2fa6-11ea-9402-ac220b26bfde', '041fd2da-3cbd-11ea-ba0e-48ba4e44ff52', '04d340ab-3bf0-11ea-9f3e-48ba4e44ff52', '', '2020-01-22 02:36:01', 1),
('65aace90-4ad2-11ea-966b-48ba4e44ff52', '3ee639e3-3030-11ea-9402-ac220b26bfde', 'a10ae542-3030-11ea-9402-ac220b26bfde', '6ffd254b-2fa6-11ea-9402-ac220b26bfde', '15a22b80-3034-11ea-9402-ac220b26bfde', '04d340ab-3bf0-11ea-9f3e-48ba4e44ff52', '', '2020-02-09 00:23:30', 0),
('ba9f80a2-305e-11ea-9402-ac220b26bfde', '3ee639e3-3030-11ea-9402-ac220b26bfde', '607c0304-3031-11ea-9402-ac220b26bfde', '6ffd254b-2fa6-11ea-9402-ac220b26bfde', '15a22b80-3034-11ea-9402-ac220b26bfde', 'cd7d0f66-3035-11ea-9402-ac220b26bfde', 'Poll de prueba del POST', '2020-01-06 08:30:00', 0),
('cc2412a2-4ac4-11ea-966b-48ba4e44ff52', '3ee639e3-3030-11ea-9402-ac220b26bfde', 'a10ae542-3030-11ea-9402-ac220b26bfde', '6ffd254b-2fa6-11ea-9402-ac220b26bfde', '15a22b80-3034-11ea-9402-ac220b26bfde', '04d340ab-3bf0-11ea-9f3e-48ba4e44ff52', '', '2020-02-08 22:46:08', 0),
('d146baa3-3cc0-11ea-ba0e-48ba4e44ff52', '3ee639e3-3030-11ea-9402-ac220b26bfde', '607c0304-3031-11ea-9402-ac220b26bfde', '6ffd254b-2fa6-11ea-9402-ac220b26bfde', '041fd2da-3cbd-11ea-ba0e-48ba4e44ff52', '04d340ab-3bf0-11ea-9f3e-48ba4e44ff52', '', '2020-01-22 02:42:17', 0);

--
-- Disparadores `procedimiento`
--
DELIMITER $$
CREATE TRIGGER `procedure_GUID` BEFORE INSERT ON `procedimiento` FOR EACH ROW begin
 SET new.idprocedure= uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question`
--

CREATE TABLE `question` (
  `idquestion` varchar(60) NOT NULL,
  `idtype_of_answer` varchar(60) NOT NULL,
  `idquestion_subgroup` varchar(60) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `question` varchar(400) NOT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `question`
--

INSERT INTO `question` (`idquestion`, `idtype_of_answer`, `idquestion_subgroup`, `name`, `question`, `erased`) VALUES
('0354809a-2fab-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '45207efc-2fa9-11ea-9402-ac220b26bfde', NULL, '02 - Subiendo y bajando escaleras', 0),
('0385ad06-4622-11ea-85d8-48ba4e44ff52', '0d10c08d-4575-11ea-85d8-48ba4e44ff52', '4f7c8326-457a-11ea-85d8-48ba4e44ff52', '3. Datos de expectativas del paciente', '2. Mis expectativas para poder realizar mis actividades normales de la vida diaria…', 0),
('0442a33f-452f-11ea-85d8-48ba4e44ff52', '68531292-452d-11ea-85d8-48ba4e44ff52', 'd57da838-452e-11ea-85d8-48ba4e44ff52', 'Instancia de la Cirugia. Rodilla Izquierda.', 'Rodilla Izquierda.', 0),
('04ef18cc-484f-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', 'bfda33b5-4634-11ea-85d8-48ba4e44ff52', 'Knee POP 2 Izq', 'Elija la respuesta.', 0),
('0aae81bb-43de-11ea-85d8-48ba4e44ff52', 'c01f7a14-43bb-11ea-85d8-48ba4e44ff52', '33829fe8-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija el diagnostico primario', 'Elija el diagnostico primario.', 0),
('0abd72ee-4490-11ea-85d8-48ba4e44ff52', '8124f187-43bd-11ea-85d8-48ba4e44ff52', '8044d14c-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('0ccf69e2-2fab-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '45207efc-2fa9-11ea-9402-ac220b26bfde', NULL, '03 - Durante la noche mientras descansa', 0),
('0f943d07-4622-11ea-85d8-48ba4e44ff52', '0d10c08d-4575-11ea-85d8-48ba4e44ff52', '4f7c8326-457a-11ea-85d8-48ba4e44ff52', '3. Datos de expectativas del paciente', '3. Mis expectativas en relación a mis actividades recreativas o deportivas', 0),
('1610844a-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '9d55b138-4625-11ea-85d8-48ba4e44ff52', '4A. ACTIVIDADES ESTANDARES.', '2-Girar sobre su pierna', 0),
('164a7e8a-4492-11ea-85d8-48ba4e44ff52', '58fed1a0-43be-11ea-85d8-48ba4e44ff52', 'b0ffa8f2-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('18544956-484f-11ea-85d8-48ba4e44ff52', '60331914-4636-11ea-85d8-48ba4e44ff52', 'c3a6c93a-4634-11ea-85d8-48ba4e44ff52', 'Knee POP 2 Der', 'Elija la respuesta.', 0),
('18b6b64a-44ac-11ea-85d8-48ba4e44ff52', '6046eb6e-44ab-11ea-85d8-48ba4e44ff52', '8a65fb3f-44ab-11ea-85d8-48ba4e44ff52', 'Elija la opción correcta', 'Elija la opción correcta.', 0),
('1b168aaa-2fab-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '45207efc-2fa9-11ea-9402-ac220b26bfde', NULL, '04 - Sentado o reposando', 0),
('1e31f9c1-452e-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', 'eab40537-452d-11ea-85d8-48ba4e44ff52', 'Momento de la Cirugia. Rodilla Derecha.', 'Rodilla Derecha.', 0),
('1ea58dd0-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', 'Nadar', 0),
('225f10cf-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '9d55b138-4625-11ea-85d8-48ba4e44ff52', '4A. ACTIVIDADES ESTANDARES.', '3-Subir o bajar una escalera', 0),
('2450a948-2fab-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '45207efc-2fa9-11ea-9402-ac220b26bfde', NULL, '05 - Estando parado', 0),
('24e21055-4850-11ea-85d8-48ba4e44ff52', '3c8c1240-463a-11ea-85d8-48ba4e44ff52', '14a98d23-4635-11ea-85d8-48ba4e44ff52', 'Knee POP 6 Izq', 'Elija la respuesta.', 0),
('2c1457a8-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '9d55b138-4625-11ea-85d8-48ba4e44ff52', '4A. ACTIVIDADES ESTANDARES.', '4-Levantarse de una silla sin apoya brazos', 0),
('2fa2ba92-4850-11ea-85d8-48ba4e44ff52', '3c8c1240-463a-11ea-85d8-48ba4e44ff52', '189fa879-4635-11ea-85d8-48ba4e44ff52', 'Knee POP 6 Der', 'Elija la respuesta.', 0),
('33e71440-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '9d55b138-4625-11ea-85d8-48ba4e44ff52', '4A. ACTIVIDADES ESTANDARES.', '5-Subir o bajar del auto', 0),
('352ad676-4490-11ea-85d8-48ba4e44ff52', 'ce2b5be7-43be-11ea-85d8-48ba4e44ff52', '84e53289-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('36180c63-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', 'Golf (18 hoyos)', 0),
('36df3796-4621-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'a646a046-4579-11ea-85d8-48ba4e44ff52', '2. SATISFACCIÓN DEL PACIENTE', '1. Actualmente, ¿qué tan satisfecho está con el nivel de dolor de su rodilla mientras está sentado?', 0),
('3ac13735-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '9d55b138-4625-11ea-85d8-48ba4e44ff52', '4A. ACTIVIDADES ESTANDARES.', '6-Moverse lateralmente, dando pasos al costado', 0),
('3d5a0e3e-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', 'Ciclismo de ruta (>30min)', 0),
('42214fc8-4625-11ea-85d8-48ba4e44ff52', '761be88e-4577-11ea-85d8-48ba4e44ff52', '99fb3fb0-4623-11ea-85d8-48ba4e44ff52', '4. ACTIVIDADES FUNCIONALES. 3', 'Elija la opción.', 0),
('43498620-4624-11ea-85d8-48ba4e44ff52', 'b2459ec4-4577-11ea-85d8-48ba4e44ff52', '8ac48b7b-4623-11ea-85d8-48ba4e44ff52', '4. ACTIVIDADES FUNCIONALES.', 'Elija la opción.', 0),
('43b87f49-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', 'Jardinería', 0),
('498233d5-4850-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '22c42a92-4635-11ea-85d8-48ba4e44ff52', 'Knee POP 7 Der', 'Elija la respuesta.', 0),
('49c1c9b5-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', 'Bowling', 0),
('5271ceeb-4850-11ea-85d8-48ba4e44ff52', 'cb51cc07-463c-11ea-85d8-48ba4e44ff52', '28871726-4635-11ea-85d8-48ba4e44ff52', 'Knee POP 7 Izq', 'Elija la respuesta.', 0),
('53cb902c-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', 'Deportes de raqueta (Tenis, Paddle) ', 0),
('57d3582e-4490-11ea-85d8-48ba4e44ff52', '8d2565b4-43be-11ea-85d8-48ba4e44ff52', '88e44279-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('5b201aff-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', 'Caminata de distancia', 0),
('5b63c66f-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '03 - Levantarse de estar sentado', 0),
('5cfe0beb-4621-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'a646a046-4579-11ea-85d8-48ba4e44ff52', '2. SATISFACCIÓN DEL PACIENTE', '2. Actualmente, ¿qué tan satisfecho está con el nivel de dolor de su rodilla mientras está en la cama?', 0),
('6184c4c1-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', ' Bailar', 0),
('61bcd427-484f-11ea-85d8-48ba4e44ff52', 'a8f251b8-4636-11ea-85d8-48ba4e44ff52', 'd31243be-4634-11ea-85d8-48ba4e44ff52', 'Knee POP 3 Der', 'Elija la respuesta.', 0),
('658af709-44a8-11ea-85d8-48ba4e44ff52', '4e878f8f-44a4-11ea-85d8-48ba4e44ff52', 'dab7b2fb-44a4-11ea-85d8-48ba4e44ff52', 'Femur.', 'Femur.', 0),
('65d86b8b-452f-11ea-85d8-48ba4e44ff52', '414ea556-452d-11ea-85d8-48ba4e44ff52', '3ad0239a-452f-11ea-85d8-48ba4e44ff52', 'Womak. Cirujano.', 'Elija el cirujano.', 0),
('665a61a2-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '04 - Estando parado por largo tiempo', 0),
('678826ac-4621-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'a646a046-4579-11ea-85d8-48ba4e44ff52', '2. SATISFACCIÓN DEL PACIENTE', '3. Actualmente, ¿qué tan satisfecho está con la función de su rodilla cuando se levanta de la cama?', 0),
('688e8a9a-462b-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '420804a8-4627-11ea-85d8-48ba4e44ff52', '4C. ACTIVIDADES ESPECIFICAS.', 'Levantamiento de pesas', 0),
('68fb696e-462a-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '395e6d6c-4627-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', 'Ejercicios de elongación', 0),
('6d1aa37c-44a9-11ea-85d8-48ba4e44ff52', 'e5be102b-44a8-11ea-85d8-48ba4e44ff52', 'e7d04916-44a4-11ea-85d8-48ba4e44ff52', 'TALLO FEMORAL.', 'TALLO FEMORAL.', 0),
('6e259dd2-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '05 - Doblado al pisoo', 0),
('6f62c873-4623-11ea-85d8-48ba4e44ff52', '761be88e-4577-11ea-85d8-48ba4e44ff52', '3525b477-4623-11ea-85d8-48ba4e44ff52', '4. ACTIVIDADES FUNCIONALES.', 'Elija la opción.', 0),
('705815fa-4621-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'a646a046-4579-11ea-85d8-48ba4e44ff52', '2. SATISFACCIÓN DEL PACIENTE', '4. Actualmente, ¿qué tan satisfecho está con la función de su rodilla cuando realiza actividades livianas de la casa?', 0),
('70720b4c-462b-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '420804a8-4627-11ea-85d8-48ba4e44ff52', '4C. ACTIVIDADES ESPECIFICAS.', 'Ejercicios de pierna', 0),
('71c31f91-4491-11ea-85d8-48ba4e44ff52', '21d5c5e4-43bf-11ea-85d8-48ba4e44ff52', '9eb3e0df-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('7681de43-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'ae9c679a-4625-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', '1-Subir una escalera', 0),
('778302e8-462b-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '420804a8-4627-11ea-85d8-48ba4e44ff52', '4C. ACTIVIDADES ESPECIFICAS.', 'Escaladora', 0),
('778a61e9-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '06 - Caminando sobre una superficie plana', 0),
('77d5dba6-484f-11ea-85d8-48ba4e44ff52', 'a8f251b8-4636-11ea-85d8-48ba4e44ff52', 'da866ced-4634-11ea-85d8-48ba4e44ff52', 'Knee POP 3 Izq', 'Elija la respuesta.', 0),
('78554e0f-4620-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', 'd39611b2-4578-11ea-85d8-48ba4e44ff52', 'A. Dolor al caminar.', 'Elija la opción. 0 = Ninguno. 10 = Severo.', 0),
('7ca6c7ae-4621-11ea-85d8-48ba4e44ff52', '9b525343-4574-11ea-85d8-48ba4e44ff52', 'a646a046-4579-11ea-85d8-48ba4e44ff52', '2. SATISFACCIÓN DEL PACIENTE', '5. Actualmente, ¿qué tan satisfecho está con la función de su rodilla cuando realiza actividades recreativas?', 0),
('7ccc5a87-4492-11ea-85d8-48ba4e44ff52', 'de09021b-43be-11ea-85d8-48ba4e44ff52', '98f49346-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('7ce3ea44-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'ae9c679a-4625-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', '2-Llevar una bolsa de comprasa', 0),
('7fa60414-44a9-11ea-85d8-48ba4e44ff52', '1fb8c3bb-44a9-11ea-85d8-48ba4e44ff52', 'e7d04916-44a4-11ea-85d8-48ba4e44ff52', 'AUMENTO FEMORAL.', 'AUMENTO FEMORAL.', 0),
('7fedfe37-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '07 - Entrando o saliendo del auto o colectivo', 0),
('8162f4fc-462b-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '420804a8-4627-11ea-85d8-48ba4e44ff52', '4C. ACTIVIDADES ESPECIFICAS.', 'Prensa', 0),
('83441b91-4490-11ea-85d8-48ba4e44ff52', 'c55f81ff-43bd-11ea-85d8-48ba4e44ff52', '8ecab61d-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('8516ee27-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'ae9c679a-4625-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', '3-Agacharse', 0),
('85db2e39-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '08 - Yendo al shopping', 0),
('88fd200b-4491-11ea-85d8-48ba4e44ff52', 'eb44e3b7-43be-11ea-85d8-48ba4e44ff52', 'a3e0d12e-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('8a70e9e0-462b-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '420804a8-4627-11ea-85d8-48ba4e44ff52', '4C. ACTIVIDADES ESPECIFICAS.', 'Trotar', 0),
('8c599616-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '09 - Poniendose las medias o calcetines', 0),
('8e632537-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'ae9c679a-4625-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', '4-Mantenerse arrodillado', 0),
('8ed7087f-462b-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '420804a8-4627-11ea-85d8-48ba4e44ff52', '4C. ACTIVIDADES ESPECIFICAS.', 'Elíptico', 0),
('907653ae-448f-11ea-85d8-48ba4e44ff52', 'ab9ca988-43be-11ea-85d8-48ba4e44ff52', '7b2f762a-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('91c5ccf1-44a9-11ea-85d8-48ba4e44ff52', '02cb456d-44a9-11ea-85d8-48ba4e44ff52', 'e7d04916-44a4-11ea-85d8-48ba4e44ff52', 'TALLO TIBIAL.', 'TALLO TIBIAL.', 0),
('92264838-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '10 - Levantandose de la cama', 0),
('944f1721-44a8-11ea-85d8-48ba4e44ff52', '56eb3aaf-44a4-11ea-85d8-48ba4e44ff52', 'dab7b2fb-44a4-11ea-85d8-48ba4e44ff52', 'Tibia.', 'Tibia.', 0),
('955a99d8-462b-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '420804a8-4627-11ea-85d8-48ba4e44ff52', '4C. ACTIVIDADES ESPECIFICAS.', 'Ejercicios aeróbicos', 0),
('95c3e5d1-4626-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', 'ae9c679a-4625-11ea-85d8-48ba4e44ff52', '4B. ACTIVIDADES AVANZADAS.', '5-Correr', 0),
('9894ca0f-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '11 - Sacandose las medias o calcetines', 0),
('9d89d324-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '12 - Acostado en la cama', 0),
('9f565bbf-484f-11ea-85d8-48ba4e44ff52', 'd989fae7-4638-11ea-85d8-48ba4e44ff52', 'e642b5bb-4634-11ea-85d8-48ba4e44ff52', 'Knee POP 4 Izq', 'Elija la respuesta.', 0),
('9f95684b-462b-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '420804a8-4627-11ea-85d8-48ba4e44ff52', '4C. ACTIVIDADES ESPECIFICAS.', 'Bicicleta fija', 0),
('a3dce412-4624-11ea-85d8-48ba4e44ff52', 'fa48bfc3-4577-11ea-85d8-48ba4e44ff52', 'b16fe25d-4623-11ea-85d8-48ba4e44ff52', '4. ACTIVIDADES FUNCIONALES.', 'Elija la opción.', 0),
('a5840b21-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '13 - Saliendo del baño', 0),
('a6e61b51-43dc-11ea-85d8-48ba4e44ff52', 'f62ba336-4253-11ea-ba0e-48ba4e44ff52', '2ef3e15b-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija el tipo de procedimiento', 'Elija el tipo de procedimiento.', 0),
('a8113b3f-44a9-11ea-85d8-48ba4e44ff52', '1fb8c3bb-44a9-11ea-85d8-48ba4e44ff52', 'e7d04916-44a4-11ea-85d8-48ba4e44ff52', 'AUMENTO TIBIAL.', 'AUMENTO TIBIAL.', 0),
('aa0bd089-4490-11ea-85d8-48ba4e44ff52', '24dcb823-43be-11ea-85d8-48ba4e44ff52', '9429f34a-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('aabdd8e2-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '14 - Sentado', 0),
('ab91f535-452e-11ea-85d8-48ba4e44ff52', 'b07287fc-452d-11ea-85d8-48ba4e44ff52', 'eab40537-452d-11ea-85d8-48ba4e44ff52', 'Momento de la Cirugia. Rodilla Izquierda.', 'Rodilla Izquierda.', 0),
('add2dc51-2fac-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '5bc7d3c6-2fa9-11ea-9402-ac220b26bfde', NULL, '01 - ¿Cuan severa es tu rigidez después del primer despertar en la mañana?', 0),
('b09cf49f-3d23-11ea-ba0e-48ba4e44ff52', '8a9f2a2c-3d23-11ea-ba0e-48ba4e44ff52', '2a3f360c-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija el lado intervenido', 'Elija el lado intervenido', 0),
('b170f78d-4620-11ea-85d8-48ba4e44ff52', '672ce525-4573-11ea-85d8-48ba4e44ff52', 'eab22429-4578-11ea-85d8-48ba4e44ff52', 'B. Dolor al subir o bajar escaleras', 'Elija la opción. 0 = Ninguno. 10 = Severo', 0),
('b231cc4e-448e-11ea-85d8-48ba4e44ff52', '4457c814-43bc-11ea-85d8-48ba4e44ff52', '38e028f4-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la causa de revisión', 'Elija la causa de revisión', 0),
('b2c781c2-484e-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '8d5232e4-4634-11ea-85d8-48ba4e44ff52', 'Elija la respuesta.', 'Elija la respuesta.', 0),
('b325a426-484f-11ea-85d8-48ba4e44ff52', 'd989fae7-4638-11ea-85d8-48ba4e44ff52', 'eac11d98-4634-11ea-85d8-48ba4e44ff52', 'Knee POP 4 Der', 'Elija la respuesta.', 0),
('b3bb6ef6-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '15 - Subiendo o bajando del inodoro', 0),
('b8b68628-4624-11ea-85d8-48ba4e44ff52', 'fa48bfc3-4577-11ea-85d8-48ba4e44ff52', 'be8156bd-4623-11ea-85d8-48ba4e44ff52', '4. ACTIVIDADES FUNCIONALES. 5', 'Elija la opción.', 0),
('b9e3eea4-3d20-11ea-ba0e-48ba4e44ff52', 'ce986650-3d1e-11ea-ba0e-48ba4e44ff52', '2604d2ef-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija el Cirujano', 'Elija el Cirujano principal.', 0),
('bb06b968-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '16 - Realizando tareas domésticas pesadas', 0),
('bbe87197-44a9-11ea-85d8-48ba4e44ff52', '1fb8c3bb-44a9-11ea-85d8-48ba4e44ff52', 'e7d04916-44a4-11ea-85d8-48ba4e44ff52', 'CONO METAL TRABECULAR.', 'CONO METAL TRABECULAR.', 0),
('c0f6873e-2fac-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '5bc7d3c6-2fa9-11ea-9402-ac220b26bfde', NULL, '02 - ¿Cuan severa es tu rigidez después de sentarte, acostarte o descansando en el día?', 0),
('c19aa900-2fad-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '17 - Realizando tareas domésticas livianas', 0),
('c61e779c-484e-11ea-85d8-48ba4e44ff52', '9062c590-4635-11ea-85d8-48ba4e44ff52', '91d61510-4634-11ea-85d8-48ba4e44ff52', 'Knee POP 1 Izq', 'Elija la respuesta.', 0),
('d64fb1d0-484f-11ea-85d8-48ba4e44ff52', '070603f0-463a-11ea-85d8-48ba4e44ff52', '00504059-4635-11ea-85d8-48ba4e44ff52', 'Knee POP 5 Izq', 'Elija la respuesta.', 0),
('d82ba19b-4620-11ea-85d8-48ba4e44ff52', 'a7a9ea45-4573-11ea-85d8-48ba4e44ff52', 'f608c873-4578-11ea-85d8-48ba4e44ff52', 'C. ¿Sientes normal tus rodillas?', 'Elija la opción.', 0),
('d8cee6f1-4491-11ea-85d8-48ba4e44ff52', '091970e2-43bf-11ea-85d8-48ba4e44ff52', 'abbe5236-3cd0-11ea-ba0e-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('dac911c8-4621-11ea-85d8-48ba4e44ff52', '0d10c08d-4575-11ea-85d8-48ba4e44ff52', '4f7c8326-457a-11ea-85d8-48ba4e44ff52', '3. Datos de expectativas del paciente', '1. Mis expectativas en relación al alivio del DOLOR.', 0),
('e18bc2ae-2fac-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '01 - Descender escaleras', 0),
('e490e7b4-484f-11ea-85d8-48ba4e44ff52', '070603f0-463a-11ea-85d8-48ba4e44ff52', 'fb83ba79-4634-11ea-85d8-48ba4e44ff52', 'Knee POP 5 Der', 'Elija la respuesta.', 0),
('eb0272d7-44ab-11ea-85d8-48ba4e44ff52', '6046eb6e-44ab-11ea-85d8-48ba4e44ff52', '7cb6f28b-44ab-11ea-85d8-48ba4e44ff52', 'Elija la opción correcta.', 'Elija la opción correcta.', 0),
('ee8bf938-2fac-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '7c87b658-2fa9-11ea-9402-ac220b26bfde', NULL, '02 - Ascender escaleras', 0),
('f1ca5029-2faa-11ea-9402-ac220b26bfde', 'cf9486f3-2faa-11ea-9402-ac220b26bfde', '45207efc-2fa9-11ea-9402-ac220b26bfde', NULL, '01 - Caminando sobre una superficie plana', 0),
('fbdf483f-452e-11ea-85d8-48ba4e44ff52', '68531292-452d-11ea-85d8-48ba4e44ff52', 'd57da838-452e-11ea-85d8-48ba4e44ff52', 'Instancia de la Cirugia. Rodilla Derecha.', 'Rodilla Derecha.', 0),
('fcca9793-448e-11ea-85d8-48ba4e44ff52', '41746e1f-43bd-11ea-85d8-48ba4e44ff52', '4031217e-3cd0-11ea-ba0e-48ba4e44ff52', '¿Tiene cirugía previa?', '¿Tiene cirugía previa?', 0),
('fd78fa54-4625-11ea-85d8-48ba4e44ff52', '630aec4c-4578-11ea-85d8-48ba4e44ff52', '9d55b138-4625-11ea-85d8-48ba4e44ff52', '4A. ACTIVIDADES ESTANDARES.', '1-Caminar sobre una superficie despareja', 0);

--
-- Disparadores `question`
--
DELIMITER $$
CREATE TRIGGER `question_GUID` BEFORE INSERT ON `question` FOR EACH ROW begin
 SET new.idquestion = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question_group`
--

CREATE TABLE `question_group` (
  `idquestion_group` varchar(60) NOT NULL,
  `idempty_poll` varchar(60) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0' COMMENT '	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `question_group`
--

INSERT INTO `question_group` (`idquestion_group`, `idempty_poll`, `name`, `description`, `erased`) VALUES
('0e45d718-4634-11ea-85d8-48ba4e44ff52', '219a9f8e-2fa7-11ea-9402-ac220b26bfde', 'F - DÉFICIT DE EXTENSIÓN (SI PRESENTA)', '', 0),
('228880eb-4634-11ea-85d8-48ba4e44ff52', '219a9f8e-2fa7-11ea-9402-ac220b26bfde', 'G - ALINEACIÓN VARO/VALGO', '', 0),
('2d909965-4534-11ea-85d8-48ba4e44ff52', '1da57156-2fa7-11ea-9402-ac220b26bfde', '1 - SINTOMAS', ' ', 0),
('3b0cecba-4c04-11ea-9d7a-48ba4e44ff52', '2d5bd8cb-4c04-11ea-9d7a-48ba4e44ff52', '1. Dolor', NULL, 0),
('3ee8f824-4c04-11ea-9d7a-48ba4e44ff52', '2d5bd8cb-4c04-11ea-9d7a-48ba4e44ff52', '2. Función', NULL, 0),
('41c13d41-4534-11ea-85d8-48ba4e44ff52', '1da57156-2fa7-11ea-9402-ac220b26bfde', '2 - SATISFACCION DEL PACIENTE', '', 0),
('43475402-4c04-11ea-9d7a-48ba4e44ff52', '2d5bd8cb-4c04-11ea-9d7a-48ba4e44ff52', '3. Actividades', NULL, 0),
('448bd831-4b8c-11ea-966b-48ba4e44ff52', 'c4c1c8ab-4b83-11ea-966b-48ba4e44ff52', 'A - Preguntas Iniciales', 'Elija la opción correcta.', 1),
('46c06b2b-4b88-11ea-966b-48ba4e44ff52', 'c4c1c8ab-4b83-11ea-966b-48ba4e44ff52', 'A - Preguntas Iniciales', 'Elija la opción correcta.', 1),
('47e471be-4534-11ea-85d8-48ba4e44ff52', '1da57156-2fa7-11ea-9402-ac220b26bfde', '3 - EXPECTATIVAS DEL PACIENTE', ' ', 0),
('4e0d4055-4534-11ea-85d8-48ba4e44ff52', '1da57156-2fa7-11ea-9402-ac220b26bfde', '4 - ACTIVIDADES FUNCIONALES', ' ', 0),
('52649c13-2fa8-11ea-9402-ac220b26bfde', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'B - DOLOR SEMANAL', 'Piense en el dolor en su rodilla en la última semana.', 0),
('545ee3f1-4534-11ea-85d8-48ba4e44ff52', '1da57156-2fa7-11ea-9402-ac220b26bfde', '4A - ACTIVIDADES ESTANDARES', ' ', 0),
('55e70064-4b8c-11ea-966b-48ba4e44ff52', 'c4c1c8ab-4b83-11ea-966b-48ba4e44ff52', 'A. Preguntas Iniciales', 'Elija la opción correcta', 0),
('57184f4a-3cce-11ea-ba0e-48ba4e44ff52', 'b2e27a69-3ccc-11ea-ba0e-48ba4e44ff52', 'A - EVALUACION PRIMARIA', 'Conteste las siguientes preguntas', 0),
('5a15fe13-4534-11ea-85d8-48ba4e44ff52', '1da57156-2fa7-11ea-9402-ac220b26bfde', '4B - ACTIVIDADES AVANZADAS', ' ', 0),
('62c7ae78-4534-11ea-85d8-48ba4e44ff52', '1da57156-2fa7-11ea-9402-ac220b26bfde', '4C - ACTIVIDADES ESPECIFICAS. ELIJA 3.', ' ', 0),
('6af72753-4c04-11ea-9d7a-48ba4e44ff52', '2d5bd8cb-4c04-11ea-9d7a-48ba4e44ff52', '4. Capacidad Física ', NULL, 0),
('8589ca66-3cce-11ea-ba0e-48ba4e44ff52', 'b2e27a69-3ccc-11ea-ba0e-48ba4e44ff52', 'B - COMPLETAR INFORMACIÓN EN CASO DE REVISION', 'Conteste las siguientes preguntas', 0),
('8da11a3b-3cce-11ea-ba0e-48ba4e44ff52', 'b2e27a69-3ccc-11ea-ba0e-48ba4e44ff52', 'C - DEFECTO OSEO', 'CLASIFICACION', 0),
('96d083dd-2fa8-11ea-9402-ac220b26bfde', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'C - RIGIDEZ', 'Piensa sobre tu RIGIDEZ (no dolor) que sentiste en tu rodilla durante las últimas 48 hs. La rigidez es una sensación de disminución de la facilidad para mover la articulación.', 0),
('a2ca288a-2fa8-11ea-9402-ac220b26bfde', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'D - DIFICULTAD', 'Piense en la dificultad que tiene para realizar las siguientes actividades físicas diarias debido a su rodilla durante las últimas 48 hs. Con esto nos referimos a su capacidad para moverse y cuidarse.', 0),
('bba2a306-4633-11ea-85d8-48ba4e44ff52', '219a9f8e-2fa7-11ea-9402-ac220b26bfde', 'A - DOLOR', '', 0),
('c8bfdcfa-4633-11ea-85d8-48ba4e44ff52', '219a9f8e-2fa7-11ea-9402-ac220b26bfde', 'B - RANGO DE MOVILIDAD', '', 0),
('dd0aa00a-4633-11ea-85d8-48ba4e44ff52', '219a9f8e-2fa7-11ea-9402-ac220b26bfde', 'C - INESTABILIDAD ANTERO-POSTERIOR (MEDIDO A ', '', 0),
('e3353ee3-452c-11ea-85d8-48ba4e44ff52', '05b01568-2fa7-11ea-9402-ac220b26bfde', 'A - PREGUNTAS INICIALES.', 'Datos generales de la cirugía.', 0),
('f1125137-4633-11ea-85d8-48ba4e44ff52', '219a9f8e-2fa7-11ea-9402-ac220b26bfde', 'D - INESTABILIDAD MEDIAL-LATERAL (MEDIDO EN E', '', 0),
('ff398d8e-4633-11ea-85d8-48ba4e44ff52', '219a9f8e-2fa7-11ea-9402-ac220b26bfde', 'E - CONTRACTURA EN FLEXIÓN (SI PRESENTA)', '', 0);

--
-- Disparadores `question_group`
--
DELIMITER $$
CREATE TRIGGER `question_group_GUID` BEFORE INSERT ON `question_group` FOR EACH ROW begin
 SET new.idquestion_group = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question_subgroup`
--

CREATE TABLE `question_subgroup` (
  `idquestion_subgroup` varchar(60) NOT NULL,
  `idquestion_group` varchar(60) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(145) DEFAULT NULL,
  `max_score` tinyint(4) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `question_subgroup`
--

INSERT INTO `question_subgroup` (`idquestion_subgroup`, `idquestion_group`, `name`, `description`, `max_score`, `erased`) VALUES
('00504059-4635-11ea-85d8-48ba4e44ff52', 'ff398d8e-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 5', 'Izquierda', NULL, 0),
('14a98d23-4635-11ea-85d8-48ba4e44ff52', '0e45d718-4634-11ea-85d8-48ba4e44ff52', 'Knee POST OP 6', 'Izquierda', NULL, 0),
('189fa879-4635-11ea-85d8-48ba4e44ff52', '0e45d718-4634-11ea-85d8-48ba4e44ff52', 'Knee POST OP 6', 'Derecha', NULL, 0),
('22c42a92-4635-11ea-85d8-48ba4e44ff52', '228880eb-4634-11ea-85d8-48ba4e44ff52', 'Knee POST OP 7', 'Derecha', NULL, 0),
('2604d2ef-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'CIRUJANO', NULL, 0),
('28871726-4635-11ea-85d8-48ba4e44ff52', '228880eb-4634-11ea-85d8-48ba4e44ff52', 'Knee POST OP 7', 'Izquierda', NULL, 0),
('2a3f360c-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'LADO', NULL, 0),
('2ef3e15b-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'TIPO DE PROCEDIMIENTO', NULL, 0),
('33829fe8-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'DIAGNOSTICO PRIMARIO', NULL, 0),
('3525b477-4623-11ea-85d8-48ba4e44ff52', '4e0d4055-4534-11ea-85d8-48ba4e44ff52', 'Knee 4 1', '1. ¿Puede caminar sin ayuda (bastón, muletas o silla de ruedas)?', NULL, 0),
('38e028f4-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'CAUSA DE REVISION', NULL, 0),
('395e6d6c-4627-11ea-85d8-48ba4e44ff52', '62c7ae78-4534-11ea-85d8-48ba4e44ff52', 'Knee 4C', 'Actividades Recreacionales', NULL, 0),
('3ad0239a-452f-11ea-85d8-48ba4e44ff52', 'e3353ee3-452c-11ea-85d8-48ba4e44ff52', 'Womak Cirujano', 'CIRUJANO', NULL, 0),
('4031217e-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'CIRUGIA PREVIA', NULL, 0),
('420804a8-4627-11ea-85d8-48ba4e44ff52', '62c7ae78-4534-11ea-85d8-48ba4e44ff52', 'Knee 4C', 'Rutina de Ejercicio y Actividades de Gimnasio', NULL, 0),
('45207efc-2fa9-11ea-9402-ac220b26bfde', '52649c13-2fa8-11ea-9402-ac220b26bfde', '', '¿Qué grado de dolor tienes?', NULL, 0),
('4f7c8326-457a-11ea-85d8-48ba4e44ff52', '47e471be-4534-11ea-85d8-48ba4e44ff52', 'Knee 3 A', 'Datos de expectativas del paciente', NULL, 0),
('5bc7d3c6-2fa9-11ea-9402-ac220b26bfde', '96d083dd-2fa8-11ea-9402-ac220b26bfde', '', '', NULL, 0),
('7b2f762a-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'ALINEACION PREOPERATORIA', NULL, 0),
('7c87b658-2fa9-11ea-9402-ac220b26bfde', 'a2ca288a-2fa8-11ea-9402-ac220b26bfde', '', '¿Qué grado de dificultad tienes?', NULL, 0),
('7cb6f28b-44ab-11ea-85d8-48ba4e44ff52', '8da11a3b-3cce-11ea-ba0e-48ba4e44ff52', '', 'FEMUR', NULL, 0),
('8044d14c-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'POLIETILENO', NULL, 0),
('84e53289-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'REEMPLAZO PATELAR', NULL, 0),
('88e44279-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'INJERTO OSEO', NULL, 0),
('8a65fb3f-44ab-11ea-85d8-48ba4e44ff52', '8da11a3b-3cce-11ea-ba0e-48ba4e44ff52', '', 'TIBIA', NULL, 0),
('8ac48b7b-4623-11ea-85d8-48ba4e44ff52', '4e0d4055-4534-11ea-85d8-48ba4e44ff52', 'Knee 4 2', '2. Si es no, ¿cuál de las siguientes ayudas usas?', NULL, 0),
('8d5232e4-4634-11ea-85d8-48ba4e44ff52', 'bba2a306-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 1', 'Derecha', NULL, 0),
('8ecab61d-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'TIPO DE INJERTO OSEO', NULL, 0),
('91d61510-4634-11ea-85d8-48ba4e44ff52', 'bba2a306-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 1', 'Izquierda', NULL, 0),
('9429f34a-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'ARTROTOMIA', NULL, 0),
('98f49346-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'LIBERACION LATERAL', NULL, 0),
('99fb3fb0-4623-11ea-85d8-48ba4e44ff52', '4e0d4055-4534-11ea-85d8-48ba4e44ff52', 'Knee 4 3', '3. ¿Usas estas ayudas debido a tus rodillas?', NULL, 0),
('9bb0e884-4b93-11ea-966b-48ba4e44ff52', '55e70064-4b8c-11ea-966b-48ba4e44ff52', 'A. Preguntas Iniciales', 'ELIJA EL CIRUJANO', NULL, 0),
('9d55b138-4625-11ea-85d8-48ba4e44ff52', '545ee3f1-4534-11ea-85d8-48ba4e44ff52', 'Knee 4 A', '¿Cuánto te molesta la rodilla durante cada una de las siguientes actividades?', NULL, 0),
('9eb3e0df-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'TORNIQUETE', NULL, 0),
('a3e0d12e-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'DRENAJE - HEMOSUCTOR', NULL, 0),
('a646a046-4579-11ea-85d8-48ba4e44ff52', '41c13d41-4534-11ea-85d8-48ba4e44ff52', 'Knee 2 A', 'Datos de satisfacción del paciente', NULL, 0),
('abbe5236-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'COMPLICACIONES INTRAOPERATORIAS', NULL, 0),
('ae9c679a-4625-11ea-85d8-48ba4e44ff52', '5a15fe13-4534-11ea-85d8-48ba4e44ff52', 'Knee 4 B', '¿Cuánto te molesta la rodilla durante cada una de las siguientes actividades?', NULL, 0),
('b0ffa8f2-3cd0-11ea-ba0e-48ba4e44ff52', '57184f4a-3cce-11ea-ba0e-48ba4e44ff52', '\"\"', 'MECANISMO EXTENSOR', NULL, 0),
('b16fe25d-4623-11ea-85d8-48ba4e44ff52', '4e0d4055-4534-11ea-85d8-48ba4e44ff52', 'Knee 4 4', '4. ¿Por cuánto tiempo puede estar de pie (con o sin ayuda) antes de sentarse debido a la incomodidad de la rodilla?', NULL, 0),
('be8156bd-4623-11ea-85d8-48ba4e44ff52', '4e0d4055-4534-11ea-85d8-48ba4e44ff52', 'Knee 4 5', '5. ¿Por cuánto tiempo puede caminar (con o sin ayuda) antes de detenerse debido a una molestia en la rodilla?', NULL, 0),
('bfda33b5-4634-11ea-85d8-48ba4e44ff52', 'c8bfdcfa-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 2', 'Izquierda', NULL, 0),
('c3a6c93a-4634-11ea-85d8-48ba4e44ff52', 'c8bfdcfa-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 2', 'Derecha', NULL, 0),
('d0df90f1-4c04-11ea-9d7a-48ba4e44ff52', '3b0cecba-4c04-11ea-9d7a-48ba4e44ff52', '1. Dolor', 'Derecha', NULL, 0),
('d31243be-4634-11ea-85d8-48ba4e44ff52', 'dd0aa00a-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 3', 'Derecha', NULL, 0),
('d39611b2-4578-11ea-85d8-48ba4e44ff52', '2d909965-4534-11ea-85d8-48ba4e44ff52', 'Knee 1 A', 'A. Dolor al caminar\r\n', NULL, 0),
('d57da838-452e-11ea-85d8-48ba4e44ff52', 'e3353ee3-452c-11ea-85d8-48ba4e44ff52', '', 'INSTANCIA DE LA CIRUGIA', NULL, 0),
('d8396d1b-4c04-11ea-9d7a-48ba4e44ff52', '3b0cecba-4c04-11ea-9d7a-48ba4e44ff52', '1. Dolor', 'Izquierda', NULL, 0),
('da866ced-4634-11ea-85d8-48ba4e44ff52', 'dd0aa00a-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 3', 'Izquierda', NULL, 0),
('dab7b2fb-44a4-11ea-85d8-48ba4e44ff52', '8589ca66-3cce-11ea-ba0e-48ba4e44ff52', '', 'REVISION DEL IMPLANTE', NULL, 0),
('e642b5bb-4634-11ea-85d8-48ba4e44ff52', 'f1125137-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 4', 'Izquierda', NULL, 0),
('e7d04916-44a4-11ea-85d8-48ba4e44ff52', '8589ca66-3cce-11ea-ba0e-48ba4e44ff52', '', 'IMPLANTES UTILIZADOS', NULL, 0),
('eab22429-4578-11ea-85d8-48ba4e44ff52', '2d909965-4534-11ea-85d8-48ba4e44ff52', 'Knee 1 B', 'B. Dolor al subir o bajar escaleras\r\n', NULL, 0),
('eab40537-452d-11ea-85d8-48ba4e44ff52', 'e3353ee3-452c-11ea-85d8-48ba4e44ff52', '', 'MOMENTO DE LA CIRUGIA', NULL, 0),
('eac11d98-4634-11ea-85d8-48ba4e44ff52', 'f1125137-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 4', 'Derecha', NULL, 0),
('ed942d0e-4c04-11ea-9d7a-48ba4e44ff52', '3ee8f824-4c04-11ea-9d7a-48ba4e44ff52', '2. Función', 'Derecha', NULL, 0),
('f0d118b0-4c04-11ea-9d7a-48ba4e44ff52', '3ee8f824-4c04-11ea-9d7a-48ba4e44ff52', '2. Función', 'Izquierda', NULL, 0),
('f4735603-4c04-11ea-9d7a-48ba4e44ff52', '43475402-4c04-11ea-9d7a-48ba4e44ff52', '3. Actividades', 'Derecha', NULL, 0),
('f608c873-4578-11ea-85d8-48ba4e44ff52', '2d909965-4534-11ea-85d8-48ba4e44ff52', 'Knee 1 C', 'C. ¿Sientes normal tus rodillas?', NULL, 0),
('f715517f-4c04-11ea-9d7a-48ba4e44ff52', '43475402-4c04-11ea-9d7a-48ba4e44ff52', '3. Actividades', 'Izquierda', NULL, 0),
('fb1da517-4c04-11ea-9d7a-48ba4e44ff52', '6af72753-4c04-11ea-9d7a-48ba4e44ff52', '4. Capacidad Física ', 'Derecha', NULL, 0),
('fb83ba79-4634-11ea-85d8-48ba4e44ff52', 'ff398d8e-4633-11ea-85d8-48ba4e44ff52', 'Knee POST OP 5', 'Derecha', NULL, 0),
('fded7b7f-4c04-11ea-9d7a-48ba4e44ff52', '6af72753-4c04-11ea-9d7a-48ba4e44ff52', '4. Capacidad Física ', 'Izquierda', NULL, 0);

--
-- Disparadores `question_subgroup`
--
DELIMITER $$
CREATE TRIGGER `question_subgroup_GUID` BEFORE INSERT ON `question_subgroup` FOR EACH ROW begin
 SET new.idquestion_subgroup = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `idrole` varchar(60) NOT NULL,
  `idpermissions` varchar(60) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `role`
--
DELIMITER $$
CREATE TRIGGER `role_GUID` BEFORE INSERT ON `role` FOR EACH ROW begin
 SET new.idrole = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service`
--

CREATE TABLE `service` (
  `idservice` varchar(60) NOT NULL,
  `service_name` varchar(45) NOT NULL,
  `description` varchar(145) NOT NULL,
  `service_code` varchar(45) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `service`
--

INSERT INTO `service` (`idservice`, `service_name`, `description`, `service_code`, `owner`, `erased`) VALUES
('607c0304-3031-11ea-9402-ac220b26bfde', 'Traumatologia', 'Servicio de traumatologia', '35489', 'Bartolome Allende', 0),
('90ea572c-3030-11ea-9402-ac220b26bfde', 'Traumatologia', 'Servicio de traumatologia', '35489', 'Bartolome Allende', 1),
('9565019b-3030-11ea-9402-ac220b26bfde', 'Traumatologia', 'Servicio de traumatologia', '35489', 'Bartolome Allende', 0),
('a10ae542-3030-11ea-9402-ac220b26bfde', 'Cardiologia', 'Servicio de Cardiologia', '35488', 'Eddie Moreira', 0),
('aeefdca5-3030-11ea-9402-ac220b26bfde', 'Cardiologia', 'Servicio de Cardiologia', '35588', 'Melisa Quiroz', 0);

--
-- Disparadores `service`
--
DELIMITER $$
CREATE TRIGGER `service_GUID` BEFORE INSERT ON `service` FOR EACH ROW begin
 SET new.idservice = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_institution`
--

CREATE TABLE `service_institution` (
  `idservice_institution` varchar(60) NOT NULL,
  `idservice` varchar(60) NOT NULL,
  `idinstitution` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `service_institution`
--

INSERT INTO `service_institution` (`idservice_institution`, `idservice`, `idinstitution`) VALUES
('6082a1d5-3031-11ea-9402-ac220b26bfde', '607c0304-3031-11ea-9402-ac220b26bfde', '3ee639e3-3030-11ea-9402-ac220b26bfde'),
('90f0e3ed-3030-11ea-9402-ac220b26bfde', '90ea572c-3030-11ea-9402-ac220b26bfde', '3ee639e3-3030-11ea-9402-ac220b26bfde'),
('956ac657-3030-11ea-9402-ac220b26bfde', '90ea572c-3030-11ea-9402-ac220b26bfde', '3ee639e3-3030-11ea-9402-ac220b26bfde'),
('a1119980-3030-11ea-9402-ac220b26bfde', 'a10ae542-3030-11ea-9402-ac220b26bfde', '3ee639e3-3030-11ea-9402-ac220b26bfde'),
('aef6b781-3030-11ea-9402-ac220b26bfde', 'aeefdca5-3030-11ea-9402-ac220b26bfde', '52659f9a-3030-11ea-9402-ac220b26bfde');

--
-- Disparadores `service_institution`
--
DELIMITER $$
CREATE TRIGGER `service_institution_GUID` BEFORE INSERT ON `service_institution` FOR EACH ROW begin
 SET new.idservice_institution = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_of_answer`
--

CREATE TABLE `type_of_answer` (
  `idtype_of_answer` varchar(60) NOT NULL,
  `type_of_answer` varchar(90) NOT NULL,
  `description` varchar(145) DEFAULT NULL,
  `addable` tinyint(1) DEFAULT '0',
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `type_of_answer`
--

INSERT INTO `type_of_answer` (`idtype_of_answer`, `type_of_answer`, `description`, `addable`, `erased`) VALUES
('02cb456d-44a9-11ea-85d8-48ba4e44ff52', 'TALLO TIBIAL', 'TALLO TIBIAL', 0, 0),
('070603f0-463a-11ea-85d8-48ba4e44ff52', 'Knee Society POP - 5', 'Elija la opción.', 1, 0),
('091970e2-43bf-11ea-85d8-48ba4e44ff52', 'COMPLICACIONES INTRAOPERATORIAS', '', 0, 0),
('0d10c08d-4575-11ea-85d8-48ba4e44ff52', 'Knee Society - 3 Expectativas.', 'Elija la opción.', 1, 0),
('1fb8c3bb-44a9-11ea-85d8-48ba4e44ff52', 'AUMENTO FEMORAL', 'AUMENTO FEMORAL', 0, 0),
('21d5c5e4-43bf-11ea-85d8-48ba4e44ff52', 'TORNIQUETE', '', 0, 0),
('24dcb823-43be-11ea-85d8-48ba4e44ff52', 'ARTROTOMIA', '', 0, 0),
('2bfef27d-44a9-11ea-85d8-48ba4e44ff52', 'AUMENTO TIBIAL', 'AUMENTO TIBIAL', 0, 0),
('363cf8cc-44a9-11ea-85d8-48ba4e44ff52', 'CONO METAL TRABECULAR', 'CONO METAL TRABECULAR', 0, 0),
('3c8c1240-463a-11ea-85d8-48ba4e44ff52', 'Knee Society POP - 6', 'Elija la opción.', 1, 0),
('414ea556-452d-11ea-85d8-48ba4e44ff52', 'CIRUJANO.', 'CIRUJANO.', 0, 0),
('41746e1f-43bd-11ea-85d8-48ba4e44ff52', 'CIRUGIA PREVIA', '', 0, 0),
('4457c814-43bc-11ea-85d8-48ba4e44ff52', 'CAUSA DE REVISION', '', 0, 0),
('4e878f8f-44a4-11ea-85d8-48ba4e44ff52', 'FEMUR', 'FEMUR.', 0, 0),
('56eb3aaf-44a4-11ea-85d8-48ba4e44ff52', 'TIBIA', 'TIBIA.', 0, 0),
('58fed1a0-43be-11ea-85d8-48ba4e44ff52', 'MECANISMO EXTENSOR', '', 0, 0),
('5efaa0e3-44a4-11ea-85d8-48ba4e44ff52', 'PATELA', 'PATELA', 0, 0),
('60331914-4636-11ea-85d8-48ba4e44ff52', 'Knee Society POP - 2', 'Elija la opción (grados).', 1, 0),
('6046eb6e-44ab-11ea-85d8-48ba4e44ff52', 'DEFECTOS OSEOS CLASIFICACION', 'DEFECTOS OSEOS CLASIFICACION', 0, 0),
('630aec4c-4578-11ea-85d8-48ba4e44ff52', 'Knee Society - 4A', 'Elija la opción.', 1, 0),
('672ce525-4573-11ea-85d8-48ba4e44ff52', 'Knee Society - 1 SINTOMAS', 'Elija la opción.', 1, 0),
('68531292-452d-11ea-85d8-48ba4e44ff52', 'INSTANCIA DE CIRUGIA.', 'INSTANCIA DE CIRUGIA.', 0, 0),
('761be88e-4577-11ea-85d8-48ba4e44ff52', 'Knee Society - 4 Si No.', 'Elija la opción.', 1, 0),
('8124f187-43bd-11ea-85d8-48ba4e44ff52', 'POLIETILENO', '', 0, 0),
('8a9f2a2c-3d23-11ea-ba0e-48ba4e44ff52', 'LADO', 'Elija una opción.', 0, 0),
('8d2565b4-43be-11ea-85d8-48ba4e44ff52', 'INJERTO OSEO', '', 0, 0),
('9062c590-4635-11ea-85d8-48ba4e44ff52', 'Knee Society POP - 1', 'Elija la opción.', 1, 0),
('9b525343-4574-11ea-85d8-48ba4e44ff52', 'Knee Society - 2 Satisfacción.', 'Elija la opción.', 1, 0),
('a7a9ea45-4573-11ea-85d8-48ba4e44ff52', 'Knee Society - 1C.', 'Elija la opción.', 1, 0),
('a8f251b8-4636-11ea-85d8-48ba4e44ff52', 'Knee Society POP - 3', 'Elija la opción.', 1, 0),
('ab9ca988-43be-11ea-85d8-48ba4e44ff52', 'ALINEACION PREOPERATORIA', '', 0, 0),
('b07287fc-452d-11ea-85d8-48ba4e44ff52', 'MOMENTO DE CIRUGIA.', 'MOMENTO DE CIRUGIA.', 0, 0),
('b2459ec4-4577-11ea-85d8-48ba4e44ff52', 'Knee Society - 4 2', 'Elija la opción.', 1, 0),
('c01f7a14-43bb-11ea-85d8-48ba4e44ff52', 'DIAGNOSTICO PRIMARIO', '', 0, 0),
('c55f81ff-43bd-11ea-85d8-48ba4e44ff52', 'TIPO DE INJERTO OSEO', '', 0, 0),
('cb51cc07-463c-11ea-85d8-48ba4e44ff52', 'Knee Society POP - 7', 'Elija la opción.', 1, 0),
('ce2b5be7-43be-11ea-85d8-48ba4e44ff52', 'REEMPLAZO PATELAR', '', 0, 0),
('ce986650-3d1e-11ea-ba0e-48ba4e44ff52', 'Elija una opción', 'Elija una opción.', 0, 0),
('cf9486f3-2faa-11ea-9402-ac220b26bfde', 'Escala de 0 a 4', 'Es una escala que va desde NINGUNO hasta EXTREMO con puntuacion del 0 al 4 respectivamente', 1, 0),
('d989fae7-4638-11ea-85d8-48ba4e44ff52', 'Knee Society POP - 4', 'Elija la opción.', 1, 0),
('de09021b-43be-11ea-85d8-48ba4e44ff52', 'LIBERACION LATERAL', '', 0, 0),
('e5be102b-44a8-11ea-85d8-48ba4e44ff52', 'TALLO FEMORAL', 'TALLO FEMORAL', 0, 0),
('eb44e3b7-43be-11ea-85d8-48ba4e44ff52', 'DRENAJE HEMOSUCTOR', '', 0, 0),
('f62ba336-4253-11ea-ba0e-48ba4e44ff52', 'TIPO DE PROCEDIMIENTO', 'Elija el tipo de procedimiento.', 0, 0),
('fa48bfc3-4577-11ea-85d8-48ba4e44ff52', 'Knee Society - 4 4', 'Elija la opción.', 1, 0);

--
-- Disparadores `type_of_answer`
--
DELIMITER $$
CREATE TRIGGER `type_of_answer_GUID` BEFORE INSERT ON `type_of_answer` FOR EACH ROW begin
 SET new.idtype_of_answer = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_of_poll`
--

CREATE TABLE `type_of_poll` (
  `idtype_of_poll` varchar(60) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `erased` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `type_of_poll`
--

INSERT INTO `type_of_poll` (`idtype_of_poll`, `description`, `erased`) VALUES
('374123cb-3c00-11ea-9f3e-48ba4e44ff52', 'prueba', 0),
('4b838099-306a-11ea-9402-ac220b26bfde', 'Pre-Quirurgico', 0);

--
-- Disparadores `type_of_poll`
--
DELIMITER $$
CREATE TRIGGER `type_of_poll_GUID` BEFORE INSERT ON `type_of_poll` FOR EACH ROW begin
 SET new.idtype_of_poll = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_of_procedure`
--

CREATE TABLE `type_of_procedure` (
  `idtype_of_procedure` varchar(60) NOT NULL,
  `description` varchar(45) NOT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `type_of_procedure`
--

INSERT INTO `type_of_procedure` (`idtype_of_procedure`, `description`, `erased`) VALUES
('19868bd9-2fa6-11ea-9402-ac220b26bfde', 'Cirugia', 0),
('210881cc-2fa6-11ea-9402-ac220b26bfde', 'Hemodinamia', 0);

--
-- Disparadores `type_of_procedure`
--
DELIMITER $$
CREATE TRIGGER `type_of_procedure_GUID` BEFORE INSERT ON `type_of_procedure` FOR EACH ROW begin
 SET new.idtype_of_procedure = uuid();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `iduser` varchar(60) NOT NULL,
  `idperson` varchar(60) NOT NULL,
  `idrole` varchar(60) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(160) NOT NULL,
  `email` varchar(45) NOT NULL,
  `alternative_email` varchar(45) DEFAULT NULL,
  `erased` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `idperson`, `idrole`, `username`, `password`, `email`, `alternative_email`, `erased`, `role`) VALUES
('04d340ab-3bf0-11ea-9f3e-48ba4e44ff52', '04d1d31d-3bf0-11ea-9f3e-48ba4e44ff52', NULL, 'Shaoran_Rendan', '$2a$10$56T0X8iOkPgi/Ug66qbzL.fje6oW57Z2K0NPoSiQPRtyHE5Q88lTW', 'shaoran.rendan@gmail.com', NULL, 0, NULL),
('6443dc14-48e0-11ea-85d8-48ba4e44ff52', '6442eceb-48e0-11ea-85d8-48ba4e44ff52', NULL, 'Shaoran_Rendan2', '$2a$10$bP4clnDCImA/nYIAqRJ9AOM3tG27XCD9KOn7/ioYj1l/LNvIQOaRG', 'shaoran.rendan@gmail.com', NULL, 1, NULL),
('67089e2b-2f9f-11ea-9402-ac220b26bfde', '6701483e-2f9f-11ea-9402-ac220b26bfde', NULL, 'fcabanilla', '$2a$10$DWs3pv7o8yPlMwjqj87kauYXwg5RLYxKCdaHyJQemuDO3.sPbBeVm', 'fcabnailla@gmail.com', NULL, 1, NULL),
('cd7d0f66-3035-11ea-9402-ac220b26bfde', 'cd7663ab-3035-11ea-9402-ac220b26bfde', NULL, 'fcabanilla', '$2a$10$dXIz1cUKgi91ZnuJ440eT.InoXBogX6nVSk1RGwKft2uG0pw1ZXle', 'federico.cabanilla@gmail.com', NULL, 1, NULL),
('edaeb2cb-4acf-11ea-966b-48ba4e44ff52', 'cd7663ab-3035-11ea-9402-ac220b26bfde', NULL, 'fcabanilla', '$2a$10$rFb1quHK20btgwL.et/m3OH.FRLyR6eBIvDEFtFWdYQKSpznD6W5u', 'federico.cabanilla@gmail.com', NULL, 0, NULL);

--
-- Disparadores `user`
--
DELIMITER $$
CREATE TRIGGER `user_GUID` BEFORE INSERT ON `user` FOR EACH ROW begin
 SET new.iduser = uuid();
end
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`idanswer`);

--
-- Indices de la tabla `detail_type_of_procedure`
--
ALTER TABLE `detail_type_of_procedure`
  ADD PRIMARY KEY (`iddetail_type_of_procedure`);

--
-- Indices de la tabla `empty_poll`
--
ALTER TABLE `empty_poll`
  ADD PRIMARY KEY (`idempty_poll`);

--
-- Indices de la tabla `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`idinstitution`);

--
-- Indices de la tabla `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idpatient`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`idpermissions`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`idperson`),
  ADD UNIQUE KEY `idperson_UNIQUE` (`idperson`);

--
-- Indices de la tabla `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`idpoll`);

--
-- Indices de la tabla `poll_detail`
--
ALTER TABLE `poll_detail`
  ADD PRIMARY KEY (`idpoll_detail`);

--
-- Indices de la tabla `procedimiento`
--
ALTER TABLE `procedimiento`
  ADD PRIMARY KEY (`idprocedure`);

--
-- Indices de la tabla `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`idquestion`);

--
-- Indices de la tabla `question_group`
--
ALTER TABLE `question_group`
  ADD PRIMARY KEY (`idquestion_group`);

--
-- Indices de la tabla `question_subgroup`
--
ALTER TABLE `question_subgroup`
  ADD PRIMARY KEY (`idquestion_subgroup`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idrole`);

--
-- Indices de la tabla `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`idservice`);

--
-- Indices de la tabla `service_institution`
--
ALTER TABLE `service_institution`
  ADD PRIMARY KEY (`idservice_institution`);

--
-- Indices de la tabla `type_of_answer`
--
ALTER TABLE `type_of_answer`
  ADD PRIMARY KEY (`idtype_of_answer`);

--
-- Indices de la tabla `type_of_poll`
--
ALTER TABLE `type_of_poll`
  ADD PRIMARY KEY (`idtype_of_poll`);

--
-- Indices de la tabla `type_of_procedure`
--
ALTER TABLE `type_of_procedure`
  ADD PRIMARY KEY (`idtype_of_procedure`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
