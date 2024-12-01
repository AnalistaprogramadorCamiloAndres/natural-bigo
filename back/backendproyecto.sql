-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2024 at 01:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backendproyecto`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` text DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(255) DEFAULT NULL,
  `CEDULA_DE_CIUDADANIA` int(11) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`, `NOMBRE`, `CORREO_ELECTRONICO`, `CEDULA_DE_CIUDADANIA`, `DIRECCION`) VALUES
(12, 'CAMILO', 'CAMILORE182@GMAIL.COM', 123456789, 'CALLE FALSA 123');

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `NOMBRES` text DEFAULT NULL,
  `APELLIDOS` text DEFAULT NULL,
  `CARGO` text DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `CEDULA_DE_CIUDADANIA` decimal(10,0) DEFAULT NULL,
  `ID_USUARIO_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`ID_EMPLEADO`, `NOMBRES`, `APELLIDOS`, `CARGO`, `TELEFONO`, `CORREO_ELECTRONICO`, `DIRECCION`, `CEDULA_DE_CIUDADANIA`, `ID_USUARIO_FK`) VALUES
(1, 'CAMILO', 'RODRIGUEZ', 'DIRECTOR', '1234567', 'CARE@HOTMAIL.COM', 'CALLE 123', 1234567, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `envio_de_productos`
--

CREATE TABLE `envio_de_productos` (
  `ID_ENVIO` int(11) NOT NULL,
  `FECHA_DE_ENVIO` datetime DEFAULT NULL,
  `TRANSPORTE_UTILIZADO` text DEFAULT NULL,
  `EMBALAJE` text DEFAULT NULL,
  `ID_PRODUCTO_FK` int(11) DEFAULT NULL,
  `ID_EMPLEADO_FK` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `envio_de_productos`
--

INSERT INTO `envio_de_productos` (`ID_ENVIO`, `FECHA_DE_ENVIO`, `TRANSPORTE_UTILIZADO`, `EMBALAJE`, `ID_PRODUCTO_FK`, `ID_EMPLEADO_FK`, `created_at`, `updated_at`) VALUES
(1, '2024-12-15 00:00:00', 'CAMION', 'CAJA', NULL, NULL, '2024-09-15 07:16:54', '2024-09-15 07:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `facturacion`
--

CREATE TABLE `facturacion` (
  `ID_FACTURA` int(11) NOT NULL,
  `FACTURA_FECHA` datetime DEFAULT NULL,
  `TOTAL_DE_LA_FACTURA` decimal(10,0) DEFAULT NULL,
  `METODO_DE_PAGO` text DEFAULT NULL,
  `ID_PRODUCTO` int(11) DEFAULT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `facturacion`
--

INSERT INTO `facturacion` (`ID_FACTURA`, `FACTURA_FECHA`, `TOTAL_DE_LA_FACTURA`, `METODO_DE_PAGO`, `ID_PRODUCTO`, `ID_CLIENTE`) VALUES
(4, '2024-12-23 00:00:00', 20000, 'EFECTIVO', NULL, NULL),
(5, '2024-12-23 00:00:00', 20000, 'EFECTIVO', NULL, NULL),
(33, '2024-11-28 00:00:00', 33, '33', 1, 12),
(34, NULL, NULL, 'demo', NULL, NULL),
(123, '2024-11-13 00:00:00', 123, '123', 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingresoalsistema`
--

CREATE TABLE `ingresoalsistema` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRE_USUARIO` text DEFAULT NULL,
  `CONTRASEÑA` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ingresoalsistema`
--

INSERT INTO `ingresoalsistema` (`ID_USUARIO`, `NOMBRE_USUARIO`, `CONTRASEÑA`, `created_at`, `updated_at`) VALUES
(1, 'CAMILO', 'CAMILO', '2024-09-15 08:25:17', '2024-09-15 08:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `inspecciondecalidad`
--

CREATE TABLE `inspecciondecalidad` (
  `ID_INSPECCION_DE_CALIDAD` int(11) NOT NULL,
  `PARAMETROS_DE_CONTROL` longtext DEFAULT NULL,
  `NIVEL_DE_CONFORMIDAD` text DEFAULT NULL,
  `FECHA_DE_INSPECCION` datetime DEFAULT NULL,
  `RESPONSABLE_DE_LA_INSPECCION` text DEFAULT NULL,
  `CRITERIOS_DE_ACEPTACION` text DEFAULT NULL,
  `APROBACION_DE_LA_INSPECCION` text DEFAULT NULL,
  `ACCIONES_CORRECTIVAS` text DEFAULT NULL,
  `ID_NUMERO_DE_LOTE_FK` varchar(255) DEFAULT NULL,
  `ID_EMPLEADO_FK` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `inspecciondecalidad`
--

INSERT INTO `inspecciondecalidad` (`ID_INSPECCION_DE_CALIDAD`, `PARAMETROS_DE_CONTROL`, `NIVEL_DE_CONFORMIDAD`, `FECHA_DE_INSPECCION`, `RESPONSABLE_DE_LA_INSPECCION`, `CRITERIOS_DE_ACEPTACION`, `APROBACION_DE_LA_INSPECCION`, `ACCIONES_CORRECTIVAS`, `ID_NUMERO_DE_LOTE_FK`, `ID_EMPLEADO_FK`, `created_at`, `updated_at`) VALUES
(1, 'CALIDAD', 'ACEPTABLE', '2024-06-08 00:00:00', 'CAMILO RODRIGUEZ', 'ACEPTABLE', 'APROBADO', 'NINGUNA', NULL, NULL, '2024-09-15 08:52:37', '2024-09-15 08:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `lotedeproduccion`
--

CREATE TABLE `lotedeproduccion` (
  `ID_LOTE` int(11) NOT NULL,
  `CANTIDAD_PRODUCIDA` varbinary(255) DEFAULT NULL,
  `FECHA_DE_PRODUCCION` datetime DEFAULT NULL,
  `FECHA_DE_VENCIMIENTO` datetime DEFAULT NULL,
  `PROVEEDOR_DE_MATERIA_PRIMA` longtext DEFAULT NULL,
  `UBICACION_DE_ALMACENAMIENTO` text DEFAULT NULL,
  `ID_PRODUCTO_FK` int(11) DEFAULT NULL,
  `ID_INSPECCION_DE_CALIDAD_FK` int(11) DEFAULT NULL,
  `ID_ENVIO_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `lotedeproduccion`
--

INSERT INTO `lotedeproduccion` (`ID_LOTE`, `CANTIDAD_PRODUCIDA`, `FECHA_DE_PRODUCCION`, `FECHA_DE_VENCIMIENTO`, `PROVEEDOR_DE_MATERIA_PRIMA`, `UBICACION_DE_ALMACENAMIENTO`, `ID_PRODUCTO_FK`, `ID_INSPECCION_DE_CALIDAD_FK`, `ID_ENVIO_FK`) VALUES
(1, 0x313030306b47, '2024-12-15 00:00:00', '2025-12-01 00:00:00', 'FRUVERS', 'BODEGA UNO', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_08_191120_create_cliente_table', 0),
(6, '2024_09_08_191120_create_empleados_table', 0),
(7, '2024_09_08_191120_create_envio_de_productos_table', 0),
(8, '2024_09_08_191120_create_facturacion_table', 0),
(9, '2024_09_08_191120_create_failed_jobs_table', 0),
(10, '2024_09_08_191120_create_ingreso_al_sistema_table', 0),
(11, '2024_09_08_191120_create_inspecci__n_de_calidad_table', 0),
(12, '2024_09_08_191120_create_lote_de_produccion_table', 0),
(13, '2024_09_08_191120_create_password_reset_tokens_table', 0),
(14, '2024_09_08_191120_create_personal_access_tokens_table', 0),
(15, '2024_09_08_191120_create_producto_table', 0),
(16, '2024_09_08_191120_create_users_table', 0),
(17, '2024_09_08_191123_add_foreign_keys_to_empleados_table', 0),
(18, '2024_09_08_191123_add_foreign_keys_to_envio_de_productos_table', 0),
(19, '2024_09_08_191123_add_foreign_keys_to_facturacion_table', 0),
(20, '2024_09_08_191123_add_foreign_keys_to_inspecci__n_de_calidad_table', 0),
(21, '2024_09_08_191123_add_foreign_keys_to_lote_de_produccion_table', 0),
(22, '2024_09_15_020623_add_timestamps_to_envio_de_productos', 2),
(23, '2024_09_15_021507_add_timestamps_to_envio_de_productos', 3),
(24, '2024_09_15_032254_add_timestamps_to_ingresoalsistema', 4),
(25, '2024_09_15_034949_add_timestamps_to_inspecciondecalidad', 5),
(26, '2024_09_15_044131_add_timestamps_to_producto_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `NOMBRE_PRODUCTO` text DEFAULT NULL,
  `DESCRIPCION` text DEFAULT NULL,
  `PRECIO` decimal(10,0) DEFAULT NULL,
  `STOCK_DISPONIBLE` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `DESCRIPCION`, `PRECIO`, `STOCK_DISPONIBLE`, `created_at`, `updated_at`) VALUES
(1, 'FRUTA DESHIDRATADA', 'COLOR ROJO', 5000, 'DISPONIBLE', '2024-09-15 09:42:56', '2024-09-15 09:42:56'),
(2, 'FRUTA DESHIDRATADA', 'COLOR ROJO', 5000, 'DISPONIBLE', '2024-09-22 20:41:43', '2024-09-22 20:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`) USING BTREE;

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_EMPLEADO`) USING BTREE,
  ADD KEY `ID USUARIO` (`ID_USUARIO_FK`) USING BTREE;

--
-- Indexes for table `envio_de_productos`
--
ALTER TABLE `envio_de_productos`
  ADD PRIMARY KEY (`ID_ENVIO`) USING BTREE,
  ADD KEY `ID PRODUCTO FK_` (`ID_PRODUCTO_FK`) USING BTREE,
  ADD KEY `ID EMPLEADO_` (`ID_EMPLEADO_FK`) USING BTREE;

--
-- Indexes for table `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`ID_FACTURA`) USING BTREE,
  ADD KEY `ID PRODUCTO FK_1` (`ID_PRODUCTO`) USING BTREE,
  ADD KEY `ID CLIENTE FK` (`ID_CLIENTE`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `ingresoalsistema`
--
ALTER TABLE `ingresoalsistema`
  ADD PRIMARY KEY (`ID_USUARIO`) USING BTREE;

--
-- Indexes for table `inspecciondecalidad`
--
ALTER TABLE `inspecciondecalidad`
  ADD PRIMARY KEY (`ID_INSPECCION_DE_CALIDAD`) USING BTREE,
  ADD KEY `ID NUMERO DE LOTE FK` (`ID_NUMERO_DE_LOTE_FK`) USING BTREE,
  ADD KEY `ID EMPLEADO` (`ID_EMPLEADO_FK`) USING BTREE;

--
-- Indexes for table `lotedeproduccion`
--
ALTER TABLE `lotedeproduccion`
  ADD PRIMARY KEY (`ID_LOTE`) USING BTREE,
  ADD KEY `ID PRODUCTO FK` (`ID_PRODUCTO_FK`) USING BTREE,
  ADD KEY `ID INSPECCION DE CALIDAD FK` (`ID_INSPECCION_DE_CALIDAD_FK`) USING BTREE,
  ADD KEY `ID ENVIO FK` (`ID_ENVIO_FK`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `ID_EMPLEADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `envio_de_productos`
--
ALTER TABLE `envio_de_productos`
  MODIFY `ID_ENVIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `ID_FACTURA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingresoalsistema`
--
ALTER TABLE `ingresoalsistema`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inspecciondecalidad`
--
ALTER TABLE `inspecciondecalidad`
  MODIFY `ID_INSPECCION_DE_CALIDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lotedeproduccion`
--
ALTER TABLE `lotedeproduccion`
  MODIFY `ID_LOTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_PRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `ID_USUARIO_FK` FOREIGN KEY (`ID_USUARIO_FK`) REFERENCES `ingresoalsistema` (`ID_USUARIO`);

--
-- Constraints for table `envio_de_productos`
--
ALTER TABLE `envio_de_productos`
  ADD CONSTRAINT `FKPR` FOREIGN KEY (`ID_PRODUCTO_FK`) REFERENCES `producto` (`ID_PRODUCTO`),
  ADD CONSTRAINT `KP` FOREIGN KEY (`ID_EMPLEADO_FK`) REFERENCES `empleados` (`ID_EMPLEADO`);

--
-- Constraints for table `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `FKCLI` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`),
  ADD CONSTRAINT `FKPRO` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`);

--
-- Constraints for table `lotedeproduccion`
--
ALTER TABLE `lotedeproduccion`
  ADD CONSTRAINT `FKE` FOREIGN KEY (`ID_ENVIO_FK`) REFERENCES `envio_de_productos` (`ID_ENVIO`),
  ADD CONSTRAINT `FKI` FOREIGN KEY (`ID_INSPECCION_DE_CALIDAD_FK`) REFERENCES `inspecciondecalidad` (`ID_INSPECCION_DE_CALIDAD`),
  ADD CONSTRAINT `FKP` FOREIGN KEY (`ID_PRODUCTO_FK`) REFERENCES `producto` (`ID_PRODUCTO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
