CREATE DATABASE  IF NOT EXISTS `backendproyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `backendproyecto`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: backendproyecto
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` text COLLATE utf8mb4_general_ci,
  `CORREO_ELECTRONICO` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CEDULA_DE_CIUDADANIA` int DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (12,'CAMILO','CAMILORE182@GMAIL.COM',123456789,'CALLE FALSA 123'),(17,'Joanthan','joanthan@gmail.com',1224234,'1224234');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `ID_EMPLEADO` int NOT NULL AUTO_INCREMENT,
  `NOMBRES` text COLLATE utf8mb4_general_ci,
  `APELLIDOS` text COLLATE utf8mb4_general_ci,
  `CARGO` text COLLATE utf8mb4_general_ci,
  `TELEFONO` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CEDULA_DE_CIUDADANIA` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ID_USUARIO_FK` int DEFAULT NULL,
  PRIMARY KEY (`ID_EMPLEADO`) USING BTREE,
  KEY `ID USUARIO` (`ID_USUARIO_FK`) USING BTREE,
  CONSTRAINT `ID_USUARIO_FK` FOREIGN KEY (`ID_USUARIO_FK`) REFERENCES `ingresoalsistema` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'CAMILO','RODRIGUEZ','DIRECTOR','1234567','CARE@HOTMAIL.COM','CALLE 123','1234567',NULL),(4,'ASDAS','DASDASD','ASDAS','ASDASDAS','DASDASD','DASDASD','ASDASD',NULL);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio_de_productos`
--

DROP TABLE IF EXISTS `envio_de_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio_de_productos` (
  `ID_ENVIO` int NOT NULL AUTO_INCREMENT,
  `FECHA_DE_ENVIO` datetime DEFAULT NULL,
  `TRANSPORTE_UTILIZADO` text COLLATE utf8mb4_general_ci,
  `EMBALAJE` text COLLATE utf8mb4_general_ci,
  `ID_PRODUCTO_FK` int DEFAULT NULL,
  `ID_EMPLEADO_FK` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ENVIO`) USING BTREE,
  KEY `ID PRODUCTO FK_` (`ID_PRODUCTO_FK`) USING BTREE,
  KEY `ID EMPLEADO_` (`ID_EMPLEADO_FK`) USING BTREE,
  CONSTRAINT `FKPR` FOREIGN KEY (`ID_PRODUCTO_FK`) REFERENCES `producto` (`ID_PRODUCTO`),
  CONSTRAINT `KP` FOREIGN KEY (`ID_EMPLEADO_FK`) REFERENCES `empleados` (`ID_EMPLEADO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio_de_productos`
--

LOCK TABLES `envio_de_productos` WRITE;
/*!40000 ALTER TABLE `envio_de_productos` DISABLE KEYS */;
INSERT INTO `envio_de_productos` VALUES (1,'2024-12-15 00:00:00','CAMION','CAJA',NULL,NULL,'2024-09-15 07:16:54','2024-09-15 07:16:54');
/*!40000 ALTER TABLE `envio_de_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacion` (
  `ID_FACTURA` int NOT NULL AUTO_INCREMENT,
  `FACTURA_FECHA` datetime DEFAULT NULL,
  `TOTAL_DE_LA_FACTURA` decimal(10,0) DEFAULT NULL,
  `METODO_DE_PAGO` text COLLATE utf8mb4_general_ci,
  `ID_PRODUCTO` int DEFAULT NULL,
  `ID_CLIENTE` int DEFAULT NULL,
  `CANTIDAD` int DEFAULT NULL,
  PRIMARY KEY (`ID_FACTURA`),
  KEY `ID PRODUCTO FK_1` (`ID_PRODUCTO`) USING BTREE,
  KEY `ID CLIENTE FK` (`ID_CLIENTE`) USING BTREE,
  CONSTRAINT `FKCLI` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`),
  CONSTRAINT `FKPRO` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=122343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion`
--

LOCK TABLES `facturacion` WRITE;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` VALUES (12,'2024-12-13 00:00:00',20000,'3',2,12,4),(123,'2024-12-20 00:00:00',5000,'1',2,17,1),(67867,'2024-12-21 00:00:00',10000,'3',2,12,2),(122342,'2024-12-12 00:00:00',15000,'3',2,17,3);
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresoalsistema`
--

DROP TABLE IF EXISTS `ingresoalsistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresoalsistema` (
  `ID_USUARIO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_USUARIO` text COLLATE utf8mb4_general_ci,
  `CONTRASEÑA` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresoalsistema`
--

LOCK TABLES `ingresoalsistema` WRITE;
/*!40000 ALTER TABLE `ingresoalsistema` DISABLE KEYS */;
INSERT INTO `ingresoalsistema` VALUES (1,'CAMILO','CAMILO','2024-09-15 08:25:17','2024-09-15 08:25:17');
/*!40000 ALTER TABLE `ingresoalsistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspecciondecalidad`
--

DROP TABLE IF EXISTS `inspecciondecalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspecciondecalidad` (
  `ID_INSPECCION_DE_CALIDAD` int NOT NULL AUTO_INCREMENT,
  `PARAMETROS_DE_CONTROL` longtext COLLATE utf8mb4_general_ci,
  `NIVEL_DE_CONFORMIDAD` text COLLATE utf8mb4_general_ci,
  `FECHA_DE_INSPECCION` datetime DEFAULT NULL,
  `RESPONSABLE_DE_LA_INSPECCION` text COLLATE utf8mb4_general_ci,
  `CRITERIOS_DE_ACEPTACION` text COLLATE utf8mb4_general_ci,
  `APROBACION_DE_LA_INSPECCION` text COLLATE utf8mb4_general_ci,
  `ACCIONES_CORRECTIVAS` text COLLATE utf8mb4_general_ci,
  `ID_NUMERO_DE_LOTE_FK` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ID_EMPLEADO_FK` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_INSPECCION_DE_CALIDAD`) USING BTREE,
  KEY `ID NUMERO DE LOTE FK` (`ID_NUMERO_DE_LOTE_FK`) USING BTREE,
  KEY `ID EMPLEADO` (`ID_EMPLEADO_FK`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspecciondecalidad`
--

LOCK TABLES `inspecciondecalidad` WRITE;
/*!40000 ALTER TABLE `inspecciondecalidad` DISABLE KEYS */;
INSERT INTO `inspecciondecalidad` VALUES (1,'CALIDAD','ACEPTABLE','2024-06-08 00:00:00','CAMILO RODRIGUEZ','ACEPTABLE','APROBADO','NINGUNA',NULL,NULL,'2024-09-15 08:52:37','2024-09-15 08:52:37');
/*!40000 ALTER TABLE `inspecciondecalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotedeproduccion`
--

DROP TABLE IF EXISTS `lotedeproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotedeproduccion` (
  `ID_LOTE` int NOT NULL AUTO_INCREMENT,
  `CANTIDAD_PRODUCIDA` varbinary(255) DEFAULT NULL,
  `FECHA_DE_PRODUCCION` datetime DEFAULT NULL,
  `FECHA_DE_VENCIMIENTO` datetime DEFAULT NULL,
  `PROVEEDOR_DE_MATERIA_PRIMA` longtext COLLATE utf8mb4_general_ci,
  `UBICACION_DE_ALMACENAMIENTO` text COLLATE utf8mb4_general_ci,
  `ID_PRODUCTO_FK` int DEFAULT NULL,
  `ID_INSPECCION_DE_CALIDAD_FK` int DEFAULT NULL,
  `ID_ENVIO_FK` int DEFAULT NULL,
  PRIMARY KEY (`ID_LOTE`) USING BTREE,
  KEY `ID PRODUCTO FK` (`ID_PRODUCTO_FK`) USING BTREE,
  KEY `ID INSPECCION DE CALIDAD FK` (`ID_INSPECCION_DE_CALIDAD_FK`) USING BTREE,
  KEY `ID ENVIO FK` (`ID_ENVIO_FK`) USING BTREE,
  CONSTRAINT `FKE` FOREIGN KEY (`ID_ENVIO_FK`) REFERENCES `envio_de_productos` (`ID_ENVIO`),
  CONSTRAINT `FKI` FOREIGN KEY (`ID_INSPECCION_DE_CALIDAD_FK`) REFERENCES `inspecciondecalidad` (`ID_INSPECCION_DE_CALIDAD`),
  CONSTRAINT `FKP` FOREIGN KEY (`ID_PRODUCTO_FK`) REFERENCES `producto` (`ID_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotedeproduccion`
--

LOCK TABLES `lotedeproduccion` WRITE;
/*!40000 ALTER TABLE `lotedeproduccion` DISABLE KEYS */;
INSERT INTO `lotedeproduccion` VALUES (1,_binary '1000kG','2024-12-15 00:00:00','2025-12-01 00:00:00','FRUVERS','BODEGA UNO',NULL,NULL,NULL);
/*!40000 ALTER TABLE `lotedeproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_09_08_191120_create_cliente_table',0),(6,'2024_09_08_191120_create_empleados_table',0),(7,'2024_09_08_191120_create_envio_de_productos_table',0),(8,'2024_09_08_191120_create_facturacion_table',0),(9,'2024_09_08_191120_create_failed_jobs_table',0),(10,'2024_09_08_191120_create_ingreso_al_sistema_table',0),(11,'2024_09_08_191120_create_inspecci__n_de_calidad_table',0),(12,'2024_09_08_191120_create_lote_de_produccion_table',0),(13,'2024_09_08_191120_create_password_reset_tokens_table',0),(14,'2024_09_08_191120_create_personal_access_tokens_table',0),(15,'2024_09_08_191120_create_producto_table',0),(16,'2024_09_08_191120_create_users_table',0),(17,'2024_09_08_191123_add_foreign_keys_to_empleados_table',0),(18,'2024_09_08_191123_add_foreign_keys_to_envio_de_productos_table',0),(19,'2024_09_08_191123_add_foreign_keys_to_facturacion_table',0),(20,'2024_09_08_191123_add_foreign_keys_to_inspecci__n_de_calidad_table',0),(21,'2024_09_08_191123_add_foreign_keys_to_lote_de_produccion_table',0),(22,'2024_09_15_020623_add_timestamps_to_envio_de_productos',2),(23,'2024_09_15_021507_add_timestamps_to_envio_de_productos',3),(24,'2024_09_15_032254_add_timestamps_to_ingresoalsistema',4),(25,'2024_09_15_034949_add_timestamps_to_inspecciondecalidad',5),(26,'2024_09_15_044131_add_timestamps_to_producto_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','99134a7a7660c324a13464a4143e7b14d0848c42d3e82c90126b687921880e3d','[\"*\"]',NULL,NULL,'2024-12-01 23:57:36','2024-12-01 23:57:36'),(2,'App\\Models\\User',1,'auth_token','19e9f375e85288bd059ac8ff46f0a11a30ac7480cd4e347b3d9d38f60a37ada2','[\"*\"]',NULL,NULL,'2024-12-02 00:01:50','2024-12-02 00:01:50'),(3,'App\\Models\\User',1,'auth_token','0b7ffb4547b0e1722cfd241a34ed41b89874e76977b5d53e9a49bb124e6071c0','[\"*\"]',NULL,NULL,'2024-12-02 00:02:23','2024-12-02 00:02:23'),(4,'App\\Models\\User',1,'auth_token','afc7ce36c5b0d59b0c65db049a6ad16fba289749dc4ae2b710e7d99dd1297e7c','[\"*\"]',NULL,NULL,'2024-12-02 00:03:12','2024-12-02 00:03:12'),(5,'App\\Models\\User',1,'auth_token','68a8d9f57d6f05c1382e165e06a41394953af3708f2dd9e7d994492a57d3bf40','[\"*\"]',NULL,NULL,'2024-12-02 00:03:59','2024-12-02 00:03:59'),(6,'App\\Models\\User',1,'auth_token','5bd8ee6dfecac49850d970ad2fa4b5b2b1926d01b44055ed65d0d3c4578a5afa','[\"*\"]',NULL,NULL,'2024-12-02 00:04:21','2024-12-02 00:04:21'),(7,'App\\Models\\User',1,'auth_token','b668c1abadabd1bbb295190b0e48c69df466483deeb867b2223449684fa36184','[\"*\"]',NULL,NULL,'2024-12-02 00:04:43','2024-12-02 00:04:43'),(8,'App\\Models\\User',1,'auth_token','91e5032016c03ac7a1d0d368c83113c6fdeff96f534e0df37b3350ae94d05a9a','[\"*\"]',NULL,NULL,'2024-12-02 00:04:58','2024-12-02 00:04:58'),(9,'App\\Models\\User',1,'auth_token','da2178dbf2a2b95790a75474c93ae811b242e294178e28aa073b9f3b54f4b482','[\"*\"]',NULL,NULL,'2024-12-02 00:05:01','2024-12-02 00:05:01'),(10,'App\\Models\\User',1,'auth_token','577994db9aa66a0d976467d51b657031b5fe311b9db65aed369798cc932b1fab','[\"*\"]',NULL,NULL,'2024-12-02 00:05:47','2024-12-02 00:05:47'),(11,'App\\Models\\User',1,'auth_token','f0a8a6fda208b6b76158abb61750ee94e273e7f9589fda74946a2bfad069a2ea','[\"*\"]',NULL,NULL,'2024-12-02 00:06:34','2024-12-02 00:06:34'),(12,'App\\Models\\User',1,'auth_token','cfb98365674d59742c3ca5ac844ab3d32a661819ba8f6531c7b49fb51d4063c2','[\"*\"]',NULL,NULL,'2024-12-02 00:07:22','2024-12-02 00:07:22'),(13,'App\\Models\\User',1,'auth_token','477c3e14e1b191e8791d7ce913119a93afa135cb595edb55c856a024d523a5b6','[\"*\"]',NULL,NULL,'2024-12-02 00:07:57','2024-12-02 00:07:57'),(14,'App\\Models\\User',1,'auth_token','92b94cee9b3e35a99a06c6d3f6afbb559d56b8f622bad3697ee0185aed2ef631','[\"*\"]',NULL,NULL,'2024-12-02 00:08:49','2024-12-02 00:08:49'),(15,'App\\Models\\User',1,'auth_token','5325bb858b6a418a122e79160463b55e25b5b7ecbf61a513c246b119915731e1','[\"*\"]',NULL,NULL,'2024-12-02 00:09:23','2024-12-02 00:09:23'),(16,'App\\Models\\User',1,'auth_token','e9edb1ecd3b2f4d03512f52fac4ddc9666984b39f4d88795fb0ff767753ba365','[\"*\"]',NULL,NULL,'2024-12-02 00:10:31','2024-12-02 00:10:31'),(17,'App\\Models\\User',1,'auth_token','8930b3305e4166c4ed1ff257ad1f5f08f7472909c277b0912df52ba5571e5265','[\"*\"]',NULL,NULL,'2024-12-02 00:10:35','2024-12-02 00:10:35'),(18,'App\\Models\\User',1,'auth_token','43cb3590fc228bb52581f7a7410ff99639d530c5da2e764ce643cc8a91d42805','[\"*\"]',NULL,NULL,'2024-12-02 00:10:36','2024-12-02 00:10:36'),(19,'App\\Models\\User',1,'auth_token','c1c7eaf348aa5519b51961043d93cc382b56f11bb6f5263bffbf55ce6ef4982e','[\"*\"]',NULL,NULL,'2024-12-02 00:10:40','2024-12-02 00:10:40'),(20,'App\\Models\\User',1,'auth_token','fdd9814dae692e0cdea0c3d5688b55ec91eb023b486a1db76aa5d1cbdc8916db','[\"*\"]',NULL,NULL,'2024-12-02 00:10:41','2024-12-02 00:10:41'),(21,'App\\Models\\User',1,'auth_token','0692ac8fe57734ad1e0c6fb8155818755f0c1d8f6fc6b3483325620be9dce5ce','[\"*\"]',NULL,NULL,'2024-12-02 00:11:56','2024-12-02 00:11:56'),(22,'App\\Models\\User',1,'auth_token','b9385fad1b51d7e57ea9ef49f971693d5a6d0b7604fa5768868dc8907c5fef84','[\"*\"]',NULL,NULL,'2024-12-02 00:14:05','2024-12-02 00:14:05'),(23,'App\\Models\\User',1,'auth_token','6682c1f87821e37db46464ec24c646f64a7a79c7edb82f2ec4d3ba09ac19e704','[\"*\"]',NULL,NULL,'2024-12-02 00:14:21','2024-12-02 00:14:21'),(24,'App\\Models\\User',1,'auth_token','8ee71f68d79c0417617f6638692deafb06b138f2f0abad72e2791cb6c6ea9d34','[\"*\"]',NULL,NULL,'2024-12-02 00:14:28','2024-12-02 00:14:28'),(25,'App\\Models\\User',1,'auth_token','46082ad324443cdd65db534abc10cd3ae448c73ff3046573be60d144c5ff5c6e','[\"*\"]',NULL,NULL,'2024-12-02 00:14:45','2024-12-02 00:14:45'),(26,'App\\Models\\User',1,'auth_token','684557104cdb1e1484c0184e8fd976ded2370eae89213c58bfae78321696dbe2','[\"*\"]',NULL,NULL,'2024-12-02 00:15:43','2024-12-02 00:15:43'),(27,'App\\Models\\User',1,'auth_token','500024e633b48fd6f722f382bd526d8f6366e3c3b3b308e1693b98eb9a2be7aa','[\"*\"]',NULL,NULL,'2024-12-02 00:17:39','2024-12-02 00:17:39'),(28,'App\\Models\\User',1,'auth_token','53981f6855eefcb62dca694cc37db9efc710c158fdbfbb147dc611ea465f7cb7','[\"*\"]',NULL,NULL,'2024-12-02 00:19:28','2024-12-02 00:19:28'),(29,'App\\Models\\User',1,'auth_token','152dec7309c58176fef977cfe1e9e888daad99fb23ad386b10ddbf32a943e38d','[\"*\"]',NULL,NULL,'2024-12-02 00:19:38','2024-12-02 00:19:38'),(30,'App\\Models\\User',1,'auth_token','58adf5a0f9c52838df2d9b5c5858ef3ef6f9e219a2fb567a242a6ec36dd9d8da','[\"*\"]',NULL,NULL,'2024-12-02 00:22:54','2024-12-02 00:22:54'),(31,'App\\Models\\User',1,'auth_token','484a1af852854b850eb78a1599f7f6c8fe46941438a3a2adefbd73d987663d7e','[\"*\"]',NULL,NULL,'2024-12-02 00:22:57','2024-12-02 00:22:57'),(32,'App\\Models\\User',1,'auth_token','811d911e35c2e9be1bea62f9004b99d6793eac46f7c3c0a956b98c272b7d8e46','[\"*\"]',NULL,NULL,'2024-12-02 00:23:03','2024-12-02 00:23:03'),(33,'App\\Models\\User',1,'auth_token','9dc7af8a79f50a93e491537dde2820030a5bad0117106f5cdc75b4b4d89f2976','[\"*\"]',NULL,NULL,'2024-12-02 00:23:30','2024-12-02 00:23:30'),(34,'App\\Models\\User',1,'auth_token','20581c3446b6bfbaf9fe93dd0981f567a4dc6af4ac3ac4085a7a68c5977fee78','[\"*\"]',NULL,NULL,'2024-12-02 00:57:10','2024-12-02 00:57:10'),(35,'App\\Models\\User',1,'auth_token','006096864ac13c9d047502dfeba8aae87e8067e8f0dae81eaaf2be8160c93c27','[\"*\"]',NULL,NULL,'2024-12-02 01:03:29','2024-12-02 01:03:29'),(36,'App\\Models\\User',1,'auth_token','52facca5da8834a242b84e27c1fdfbcd8b30c9cc6db6751594ac5c882c1dd032','[\"*\"]',NULL,NULL,'2024-12-02 01:03:59','2024-12-02 01:03:59'),(37,'App\\Models\\User',1,'auth_token','68a1f9fe80d6f641bcf7e02177c51c7de810af63f2bf60940de445fa204a41ae','[\"*\"]',NULL,NULL,'2024-12-02 01:16:55','2024-12-02 01:16:55'),(38,'App\\Models\\User',1,'auth_token','a742634d33e1b67ca8927dce685973a5d39fb2f745292de89015346ce497ace2','[\"*\"]',NULL,NULL,'2024-12-02 01:52:25','2024-12-02 01:52:25'),(39,'App\\Models\\User',1,'auth_token','c1678593c3fb9d06fb2559b1ec3a59d727cb15dabf0d88c83df4674953d5c5dd','[\"*\"]',NULL,NULL,'2024-12-02 01:53:14','2024-12-02 01:53:14'),(40,'App\\Models\\User',1,'auth_token','252a40359f5e9ff7a021ca0257438e140a246627a161c113b820e8d017d0f8a9','[\"*\"]',NULL,NULL,'2024-12-02 01:53:47','2024-12-02 01:53:47');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_PRODUCTO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_PRODUCTO` text COLLATE utf8mb4_general_ci,
  `DESCRIPCION` text COLLATE utf8mb4_general_ci,
  `PRECIO` decimal(10,0) DEFAULT NULL,
  `STOCK_DISPONIBLE` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'FRUTA DESHIDRATADA','COLOR ROJO',5000,'DISPONIBLE','2024-09-15 09:42:56','2024-09-15 09:42:56'),(2,'FRUTA DESHIDRATADA2','COLOR ROJO',5000,'DISPONIBLE','2024-09-22 20:41:43','2024-09-22 20:41:43');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Camilo','camilo@gmail.com',NULL,'$2y$10$emeYT3e3SfMPt6RMhxoPF..lNOhnVj4NjhdoYB/lo5.kxbeA.x3wW',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 16:07:32
