CREATE DATABASE  IF NOT EXISTS `prestamos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `prestamos`;
-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: prestamos
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.11-MariaDB-10.2.11+maria~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cuenta` varchar(45) NOT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` text NOT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `dui` char(10) NOT NULL,
  `nit` char(17) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `sexo` char(1) CHARACTER SET big5 NOT NULL,
  `direccion` text NOT NULL,
  `telefonos` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `observaciones` text DEFAULT NULL,
  `profesion` varchar(45) NOT NULL,
  PRIMARY KEY (`dui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuota`
--

DROP TABLE IF EXISTS `cuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuota` (
  `id_prestamo` int(11) NOT NULL,
  `num_cuota` int(11) NOT NULL,
  `valor` double NOT NULL,
  `interes` double NOT NULL,
  `fecha` date NOT NULL,
  `capital` double NOT NULL,
  `saldo_anterior` double NOT NULL,
  `saldo_actualizado` double NOT NULL,
  `mora` double DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`,`num_cuota`),
  CONSTRAINT `fk_cuota_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota`
--

LOCK TABLES `cuota` WRITE;
/*!40000 ALTER TABLE `cuota` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `dui` char(10) NOT NULL,
  `correlativo` int(11) NOT NULL,
  `nombre_archivo` text NOT NULL,
  `archivo` longblob NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`dui`,`correlativo`),
  CONSTRAINT `fk_documentos_cliente1` FOREIGN KEY (`dui`) REFERENCES `cliente` (`dui`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_resultados`
--

DROP TABLE IF EXISTS `estado_resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_resultados` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cuenta` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_resultados`
--

LOCK TABLES `estado_resultados` WRITE;
/*!40000 ALTER TABLE `estado_resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_er`
--

DROP TABLE IF EXISTS `movimientos_er`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_er` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  CONSTRAINT `id_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `estado_resultados` (`id_cuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_er`
--

LOCK TABLES `movimientos_er` WRITE;
/*!40000 ALTER TABLE `movimientos_er` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_er` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametro` (
  `id_parametro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `valor` varchar(100) NOT NULL,
  PRIMARY KEY (`id_parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
INSERT INTO `parametro` VALUES (1,'interes_mensual','5.0'),(2,'interes_diaria','5.0'),(3,'mora','5.0');
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL AUTO_INCREMENT,
  `dui` char(10) NOT NULL,
  `monto` double NOT NULL,
  `valor_cuota` double NOT NULL,
  `tasa_interes` double NOT NULL,
  `cantidad_cuotas` int(3) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_ultimo_pago` date DEFAULT NULL,
  `saldo` double NOT NULL,
  `estado` char(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `capitalizacion` char(1) NOT NULL,
  `tasa_mora` double NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_prestamo_cliente1_idx` (`dui`),
  CONSTRAINT `fk_prestamo_cliente1` FOREIGN KEY (`dui`) REFERENCES `cliente` (`dui`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `clave` char(32) NOT NULL,
  `rol` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (5,'admin','admin','admin','admin','a');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-01  9:20:52
