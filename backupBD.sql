-- MySQL dump 10.15  Distrib 10.0.27-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: SaludFeminista
-- ------------------------------------------------------
-- Server version	10.0.27-MariaDB

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
-- Table structure for table `Comentario`
--

DROP TABLE IF EXISTS `Comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(200) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Comentario_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comentario`
--

LOCK TABLES `Comentario` WRITE;
/*!40000 ALTER TABLE `Comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComentarioXProfesional`
--

DROP TABLE IF EXISTS `ComentarioXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComentarioXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idComentario` int(11) NOT NULL,
  `idProfesional` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ComentarioXProfesional_id_uindex` (`id`),
  KEY `ComentarioXProfesional_Comentario_id_fk` (`idComentario`),
  KEY `ComentarioXProfesional_Profesional_id_fk` (`idProfesional`),
  CONSTRAINT `ComentarioXProfesional_Comentario_id_fk` FOREIGN KEY (`idComentario`) REFERENCES `Comentario` (`id`),
  CONSTRAINT `ComentarioXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComentarioXProfesional`
--

LOCK TABLES `ComentarioXProfesional` WRITE;
/*!40000 ALTER TABLE `ComentarioXProfesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `ComentarioXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DireccionXProfesional`
--

DROP TABLE IF EXISTS `DireccionXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DireccionXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDireccion` int(11) NOT NULL,
  `idProfesional` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DireccionXProfesional_id_uindex` (`id`),
  KEY `DireccionXProfesional_Dirección_id_fk` (`idDireccion`),
  KEY `DireccionXProfesional_Profesional_id_fk` (`idProfesional`),
  CONSTRAINT `DireccionXProfesional_Dirección_id_fk` FOREIGN KEY (`idDireccion`) REFERENCES `Dirección` (`id`),
  CONSTRAINT `DireccionXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DireccionXProfesional`
--

LOCK TABLES `DireccionXProfesional` WRITE;
/*!40000 ALTER TABLE `DireccionXProfesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `DireccionXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dirección`
--

DROP TABLE IF EXISTS `Dirección`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dirección` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(50) NOT NULL,
  `nombreLugar` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `idLocalidad` int(11) NOT NULL,
  `esPrivado` bit(1) NOT NULL DEFAULT b'0',
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dirección_id_uindex` (`id`),
  KEY `Dirección_Localidad_id_fk` (`idLocalidad`),
  CONSTRAINT `Dirección_Localidad_id_fk` FOREIGN KEY (`idLocalidad`) REFERENCES `Localidad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dirección`
--

LOCK TABLES `Dirección` WRITE;
/*!40000 ALTER TABLE `Dirección` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dirección` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Especialidad`
--

DROP TABLE IF EXISTS `Especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Especialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Especialidad_id_uindex` (`id`),
  UNIQUE KEY `Especialidad_nombre_uindex` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Especialidad`
--

LOCK TABLES `Especialidad` WRITE;
/*!40000 ALTER TABLE `Especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EspecialidadXProfesional`
--

DROP TABLE IF EXISTS `EspecialidadXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EspecialidadXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEspecialidad` int(11) NOT NULL,
  `idProfesional` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EspecialidadXProfesional_id_uindex` (`id`),
  KEY `EspecialidadXProfesional_Especialidad_id_fk` (`idEspecialidad`),
  KEY `EspecialidadXProfesional_Profesional_id_fk` (`idProfesional`),
  CONSTRAINT `EspecialidadXProfesional_Especialidad_id_fk` FOREIGN KEY (`idEspecialidad`) REFERENCES `Especialidad` (`id`),
  CONSTRAINT `EspecialidadXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EspecialidadXProfesional`
--

LOCK TABLES `EspecialidadXProfesional` WRITE;
/*!40000 ALTER TABLE `EspecialidadXProfesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `EspecialidadXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Localidad`
--

DROP TABLE IF EXISTS `Localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Localidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Localidad_id_uindex` (`id`),
  KEY `Localidad_Provincia_id_fk` (`idProvincia`),
  CONSTRAINT `Localidad_Provincia_id_fk` FOREIGN KEY (`idProvincia`) REFERENCES `Provincia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Localidad`
--

LOCK TABLES `Localidad` WRITE;
/*!40000 ALTER TABLE `Localidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObraSocial`
--

DROP TABLE IF EXISTS `ObraSocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObraSocial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `plan` varchar(50) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ObraSocial_id_uindex` (`id`),
  UNIQUE KEY `ObraSocial_nombre_uindex` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObraSocial`
--

LOCK TABLES `ObraSocial` WRITE;
/*!40000 ALTER TABLE `ObraSocial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObraSocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObraSocialXProfesional`
--

DROP TABLE IF EXISTS `ObraSocialXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObraSocialXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesional` int(11) NOT NULL,
  `idObraSocial` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ObraSocialXProfesional_id_uindex` (`id`),
  KEY `ObraSocialXProfesional_Profesional_id_fk` (`idProfesional`),
  KEY `ObraSocialXProfesional_ObraSocial_id_fk` (`idObraSocial`),
  CONSTRAINT `ObraSocialXProfesional_ObraSocial_id_fk` FOREIGN KEY (`idObraSocial`) REFERENCES `ObraSocial` (`id`),
  CONSTRAINT `ObraSocialXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObraSocialXProfesional`
--

LOCK TABLES `ObraSocialXProfesional` WRITE;
/*!40000 ALTER TABLE `ObraSocialXProfesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObraSocialXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Procedimiento`
--

DROP TABLE IF EXISTS `Procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Procedimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `activo` bit(1) NOT NULL,
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Procedimiento_id_uindex` (`id`),
  UNIQUE KEY `Procedimiento_nombre_uindex` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Procedimiento`
--

LOCK TABLES `Procedimiento` WRITE;
/*!40000 ALTER TABLE `Procedimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Procedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProcedimientoXProfesionalXEspecialidad`
--

DROP TABLE IF EXISTS `ProcedimientoXProfesionalXEspecialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProcedimientoXProfesionalXEspecialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProcedimiento` int(11) NOT NULL,
  `idEspecialidadXProfesional` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ProcedimientoXProfesionalXEspecialidad_id_uindex` (`id`),
  KEY `ProcedimientoXProfesionalXEspecialidad_Procedimiento_id_fk` (`idProcedimiento`),
  KEY `ProcXProfXEsp_EspXProf_id_fk` (`idEspecialidadXProfesional`),
  CONSTRAINT `ProcXProfXEsp_EspXProf_id_fk` FOREIGN KEY (`idEspecialidadXProfesional`) REFERENCES `EspecialidadXProfesional` (`id`),
  CONSTRAINT `ProcedimientoXProfesionalXEspecialidad_Procedimiento_id_fk` FOREIGN KEY (`idProcedimiento`) REFERENCES `Procedimiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProcedimientoXProfesionalXEspecialidad`
--

LOCK TABLES `ProcedimientoXProfesionalXEspecialidad` WRITE;
/*!40000 ALTER TABLE `ProcedimientoXProfesionalXEspecialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProcedimientoXProfesionalXEspecialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesional`
--

DROP TABLE IF EXISTS `Profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Profesional_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesional`
--

LOCK TABLES `Profesional` WRITE;
/*!40000 ALTER TABLE `Profesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincia`
--

DROP TABLE IF EXISTS `Provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Provincia_id_uindex` (`id`),
  UNIQUE KEY `Provincia_nombre_uindex` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincia`
--

LOCK TABLES `Provincia` WRITE;
/*!40000 ALTER TABLE `Provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono`
--

DROP TABLE IF EXISTS `Telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefono` (
  `numero` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero`),
  UNIQUE KEY `Telefono_numero_uindex` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono`
--

LOCK TABLES `Telefono` WRITE;
/*!40000 ALTER TABLE `Telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelefonoXDireccion`
--

DROP TABLE IF EXISTS `TelefonoXDireccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelefonoXDireccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` bigint(20) NOT NULL,
  `idDireccion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TelefonoXDireccion_id_uindex` (`id`),
  KEY `TelefonoXDireccion_Telefono_numero_fk` (`telefono`),
  KEY `TelefonoXDireccion_Dirección_id_fk` (`idDireccion`),
  CONSTRAINT `TelefonoXDireccion_Dirección_id_fk` FOREIGN KEY (`idDireccion`) REFERENCES `Dirección` (`id`),
  CONSTRAINT `TelefonoXDireccion_Telefono_numero_fk` FOREIGN KEY (`telefono`) REFERENCES `Telefono` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelefonoXDireccion`
--

LOCK TABLES `TelefonoXDireccion` WRITE;
/*!40000 ALTER TABLE `TelefonoXDireccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `TelefonoXDireccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ValoracionXProfesional`
--

DROP TABLE IF EXISTS `ValoracionXProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ValoracionXProfesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesional` int(11) NOT NULL,
  `idValoracion` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ValoracionXProfesional_id_uindex` (`id`),
  KEY `ValoracionXProfesional_Profesional_id_fk` (`idProfesional`),
  KEY `ValoracionXProfesional_Valoración_id_fk` (`idValoracion`),
  CONSTRAINT `ValoracionXProfesional_Profesional_id_fk` FOREIGN KEY (`idProfesional`) REFERENCES `Profesional` (`id`),
  CONSTRAINT `ValoracionXProfesional_Valoración_id_fk` FOREIGN KEY (`idValoracion`) REFERENCES `Valoración` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ValoracionXProfesional`
--

LOCK TABLES `ValoracionXProfesional` WRITE;
/*!40000 ALTER TABLE `ValoracionXProfesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `ValoracionXProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Valoración`
--

DROP TABLE IF EXISTS `Valoración`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Valoración` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fechaDeAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Valoración_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Valoración`
--

LOCK TABLES `Valoración` WRITE;
/*!40000 ALTER TABLE `Valoración` DISABLE KEYS */;
/*!40000 ALTER TABLE `Valoración` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-30  4:55:07
