-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-11-2019 a las 18:37:31
-- Versión del servidor: 10.2.27-MariaDB
-- Versión de PHP: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u485587866_prtal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alta`
--

CREATE TABLE `alta` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnostico_alta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lugar_alta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingresos_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(4) NOT NULL,
  `ciudad_nombre` varchar(60) NOT NULL,
  `cp` int(4) NOT NULL,
  `provincia_id` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corotac`
--

CREATE TABLE `corotac` (
  `id` int(10) UNSIGNED NOT NULL,
  `apellido` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso` decimal(8,2) DEFAULT NULL,
  `talla` int(11) DEFAULT NULL,
  `asc` decimal(8,2) DEFAULT NULL,
  `fecha_estudio` date DEFAULT NULL,
  `solicitante` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metodo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medicacion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fc` int(11) DEFAULT NULL,
  `radiacion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contraste` int(11) DEFAULT NULL,
  `dominancia` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score_ca` int(11) DEFAULT NULL,
  `cd_proximal` int(11) DEFAULT NULL,
  `cd_media` int(11) DEFAULT NULL,
  `cd_distal` int(11) DEFAULT NULL,
  `cd_dp` int(11) DEFAULT NULL,
  `cd_cx` int(11) DEFAULT NULL,
  `tci` int(11) DEFAULT NULL,
  `da_proximal` int(11) DEFAULT NULL,
  `da_media` int(11) DEFAULT NULL,
  `da_distal` int(11) DEFAULT NULL,
  `d1` int(11) DEFAULT NULL,
  `d2` int(11) DEFAULT NULL,
  `cx_proximal` int(11) DEFAULT NULL,
  `m1` int(11) DEFAULT NULL,
  `m2` int(11) DEFAULT NULL,
  `cx_distal` int(11) DEFAULT NULL,
  `dp_cx` int(11) DEFAULT NULL,
  `pl_cx` int(11) DEFAULT NULL,
  `intermedio` int(11) DEFAULT NULL,
  `pl_cd` int(11) DEFAULT NULL,
  `pl_dp` int(11) DEFAULT NULL,
  `senos` decimal(8,2) DEFAULT NULL,
  `ust` decimal(8,2) DEFAULT NULL,
  `ascendente` decimal(8,2) DEFAULT NULL,
  `raiz` decimal(8,2) DEFAULT NULL,
  `derecha` decimal(8,2) DEFAULT NULL,
  `izquierda` decimal(8,2) DEFAULT NULL,
  `venas_pulmonares` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orejuela_izquierda` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pericardio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_cardiacos` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conclusion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pacientes_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cultivos`
--

CREATE TABLE `cultivos` (
  `idcultivo` int(11) NOT NULL,
  `fecha` text NOT NULL,
  `apellido` text NOT NULL,
  `muestra` text NOT NULL,
  `antibiotico` text NOT NULL,
  `sensible` text DEFAULT NULL,
  `resistente` text DEFAULT NULL,
  `definitivo` text DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL,
  `germen` text DEFAULT NULL,
  `ingresos_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evolucion`
--

CREATE TABLE `evolucion` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evolucion` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingreso_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero_internacion` int(11) DEFAULT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad` smallint(6) NOT NULL,
  `dni` int(11) NOT NULL,
  `peso` decimal(8,2) DEFAULT NULL,
  `talla` decimal(65,2) DEFAULT NULL,
  `imc` decimal(8,2) DEFAULT NULL,
  `ciudad_origen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os_numero` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `med_cabecera` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo_consulta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antecedentes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `antecedentes_qx` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `med_habitual` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ahf` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toxicos` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_complementarios` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ant_enf_actual` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ex_fisico` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `laboratorio` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecg` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rx_torax` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otros_estudios` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnostico_presuntivo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conducta` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `alergias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha_novedades` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `novedades` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ingreso_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `apellido` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `fdnacimiento` date NOT NULL,
  `sexo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obra_social` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os_numero` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad_origen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alergias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimientos`
--

CREATE TABLE `procedimientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `tipo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `procedimiento` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ingresos_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` smallint(2) NOT NULL,
  `provincia_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resonancias`
--

CREATE TABLE `resonancias` (
  `id` int(10) UNSIGNED NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `talla` int(11) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `sc` tinyint(4) DEFAULT NULL,
  `solicitud` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitante` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exploracion` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VI` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perfusion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VD` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conclusion` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnostico_final` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firma` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `condicion` tinyint(1) DEFAULT NULL,
  `veyectivoao` decimal(10,2) DEFAULT NULL,
  `veyectivopul` decimal(10,2) DEFAULT NULL,
  `vregurgao` decimal(10,2) DEFAULT NULL,
  `veregurgpul` decimal(10,2) DEFAULT NULL,
  `flujomedioao` decimal(10,2) DEFAULT NULL,
  `flujomediopul` decimal(10,2) DEFAULT NULL,
  `velmediaao` decimal(10,2) DEFAULT NULL,
  `velmediapul` decimal(10,2) DEFAULT NULL,
  `voltelediasVI` decimal(10,2) DEFAULT NULL,
  `voltelediasIndex` decimal(10,2) DEFAULT NULL,
  `voltelesisVI` decimal(10,2) DEFAULT NULL,
  `voltelesisVIIndex` decimal(10,2) DEFAULT NULL,
  `voleyeccionsistVI` decimal(10,2) DEFAULT NULL,
  `voleyeccionsisVIIndex` decimal(10,2) DEFAULT NULL,
  `feyVI` decimal(10,2) DEFAULT NULL,
  `GCVI` decimal(10,2) DEFAULT NULL,
  `IndCardVI` decimal(10,2) DEFAULT NULL,
  `masatotalVI` decimal(10,2) DEFAULT NULL,
  `masatotalVIIndex` decimal(10,2) DEFAULT NULL,
  `voltelediasVD` decimal(10,2) DEFAULT NULL,
  `voltelesisVD` decimal(10,2) DEFAULT NULL,
  `voleyeccionsisVD` decimal(10,2) DEFAULT NULL,
  `voleyeccionsisVDIndex` decimal(10,2) DEFAULT NULL,
  `voltelediasVDIndex` decimal(10,2) DEFAULT NULL,
  `voltelesisVDIndex` decimal(10,2) DEFAULT NULL,
  `feyVD` decimal(10,2) DEFAULT NULL,
  `GCVD` decimal(10,2) DEFAULT NULL,
  `IndCardVD` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` enum('all-access','no-access') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sector` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tagging_tagged`
--

CREATE TABLE `tagging_tagged` (
  `id` int(10) UNSIGNED NOT NULL,
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_slug` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tagging_tags`
--

CREATE TABLE `tagging_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_group_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suggest` tinyint(1) NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tagging_tag_groups`
--

CREATE TABLE `tagging_tag_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` int(3) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoraciones`
--

CREATE TABLE `valoraciones` (
  `idvaloracion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `apellido` text DEFAULT NULL,
  `edad` tinyint(4) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `sexo` tinytext DEFAULT NULL,
  `cirugia` text DEFAULT NULL,
  `alergias` char(11) DEFAULT NULL,
  `alergiascual` text DEFAULT NULL,
  `otros` text DEFAULT NULL,
  `otroscuales` text DEFAULT NULL,
  `cxprevias` text DEFAULT NULL,
  `cxpreviascuales` text DEFAULT NULL,
  `altoriesgo` text DEFAULT NULL,
  `ecg` tinytext DEFAULT NULL,
  `antecedentes` tinytext DEFAULT NULL,
  `medhabitual` mediumtext DEFAULT NULL,
  `antecedentescv` mediumtext DEFAULT NULL,
  `enfcoronariadetalles` text DEFAULT NULL,
  `actividadfisica` text DEFAULT NULL,
  `sintomas` text DEFAULT NULL,
  `sintomascuales` text DEFAULT NULL,
  `exfisico` mediumtext DEFAULT NULL,
  `tension` tinytext DEFAULT NULL,
  `tas` int(11) DEFAULT NULL,
  `tad` int(11) DEFAULT NULL,
  `popen` tinytext DEFAULT NULL,
  `indicaciones` mediumtext DEFAULT NULL,
  `riesgo` text DEFAULT NULL,
  `firma` text DEFAULT NULL,
  `lee` text DEFAULT NULL,
  `condicion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alta`
--
ALTER TABLE `alta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alta_ingreso_id_foreign` (`ingresos_id`),
  ADD KEY `alta_deleted_at_index` (`deleted_at`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cp` (`cp`);

--
-- Indices de la tabla `corotac`
--
ALTER TABLE `corotac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pacientes_id` (`pacientes_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `cultivos`
--
ALTER TABLE `cultivos`
  ADD PRIMARY KEY (`idcultivo`),
  ADD KEY `ingresos_id` (`ingresos_id`);

--
-- Indices de la tabla `evolucion`
--
ALTER TABLE `evolucion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evolucion_ingreso_id_foreign` (`ingreso_id`),
  ADD KEY `evolucion_deleted_at_index` (`deleted_at`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresos_ibfk_1` (`room_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `novedades_deleted_at_index` (`deleted_at`),
  ADD KEY `novedades_ibfk_1` (`ingreso_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pacientes_deleted_at_index` (`deleted_at`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indices de la tabla `procedimientos`
--
ALTER TABLE `procedimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ingresos_id` (`ingresos_id`);

--
-- Indices de la tabla `resonancias`
--
ALTER TABLE `resonancias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_ibfk_1` (`role_id`),
  ADD KEY `role_user_ibfk_2` (`user_id`);

--
-- Indices de la tabla `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tagging_tagged`
--
ALTER TABLE `tagging_tagged`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagging_tagged_taggable_id_index` (`taggable_id`),
  ADD KEY `tagging_tagged_taggable_type_index` (`taggable_type`),
  ADD KEY `tagging_tagged_tag_slug_index` (`tag_slug`);

--
-- Indices de la tabla `tagging_tags`
--
ALTER TABLE `tagging_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagging_tags_slug_index` (`slug`),
  ADD KEY `tagging_tags_tag_group_id_foreign` (`tag_group_id`);

--
-- Indices de la tabla `tagging_tag_groups`
--
ALTER TABLE `tagging_tag_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagging_tag_groups_slug_index` (`slug`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `valoraciones`
--
ALTER TABLE `valoraciones`
  ADD PRIMARY KEY (`idvaloracion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alta`
--
ALTER TABLE `alta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `corotac`
--
ALTER TABLE `corotac`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cultivos`
--
ALTER TABLE `cultivos`
  MODIFY `idcultivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evolucion`
--
ALTER TABLE `evolucion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `procedimientos`
--
ALTER TABLE `procedimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resonancias`
--
ALTER TABLE `resonancias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tagging_tagged`
--
ALTER TABLE `tagging_tagged`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tagging_tags`
--
ALTER TABLE `tagging_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tagging_tag_groups`
--
ALTER TABLE `tagging_tag_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `valoraciones`
--
ALTER TABLE `valoraciones`
  MODIFY `idvaloracion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alta`
--
ALTER TABLE `alta`
  ADD CONSTRAINT `alta_ibfk_1` FOREIGN KEY (`ingresos_id`) REFERENCES `ingresos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `corotac`
--
ALTER TABLE `corotac`
  ADD CONSTRAINT `corotac_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `corotac_ibfk_2` FOREIGN KEY (`pacientes_id`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `cultivos`
--
ALTER TABLE `cultivos`
  ADD CONSTRAINT `cultivos_ibfk_1` FOREIGN KEY (`ingresos_id`) REFERENCES `ingresos` (`id`);

--
-- Filtros para la tabla `evolucion`
--
ALTER TABLE `evolucion`
  ADD CONSTRAINT `evolucion_ingreso_id_foreign` FOREIGN KEY (`ingreso_id`) REFERENCES `ingresos` (`id`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD CONSTRAINT `novedades_ibfk_1` FOREIGN KEY (`ingreso_id`) REFERENCES `ingresos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);

--
-- Filtros para la tabla `procedimientos`
--
ALTER TABLE `procedimientos`
  ADD CONSTRAINT `procedimientos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `procedimientos_ibfk_2` FOREIGN KEY (`ingresos_id`) REFERENCES `ingresos` (`id`);

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tagging_tags`
--
ALTER TABLE `tagging_tags`
  ADD CONSTRAINT `tagging_tags_tag_group_id_foreign` FOREIGN KEY (`tag_group_id`) REFERENCES `tagging_tag_groups` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
