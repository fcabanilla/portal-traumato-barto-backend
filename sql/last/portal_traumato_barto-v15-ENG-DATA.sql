-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `idanswer` varchar(60) NOT NULL,
  `idtype_of_answer` varchar(60) NOT NULL,
  `answer` varchar(60) NOT NULL,
  `score` tinyint(4) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idanswer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES ('cf98de11-2faa-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','NINGUNO',0,0),('cf9c6741-2faa-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','LEVE',1,0),('cfa01f07-2faa-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','MODERADO',2,0),('cfa7c196-2faa-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','SEVERO',3,0),('cfafabbe-2faa-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','EXTREMO',4,0);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_type_of_procedure`
--

DROP TABLE IF EXISTS `detail_type_of_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_type_of_procedure` (
  `iddetail_type_of_procedure` varchar(60) NOT NULL,
  `idtype_of_procedure` varchar(60) NOT NULL,
  `detail` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`iddetail_type_of_procedure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_type_of_procedure`
--

LOCK TABLES `detail_type_of_procedure` WRITE;
/*!40000 ALTER TABLE `detail_type_of_procedure` DISABLE KEYS */;
INSERT INTO `detail_type_of_procedure` VALUES ('6791e5e6-2fa6-11ea-9402-ac220b26bfde','19868bd9-2fa6-11ea-9402-ac220b26bfde','Apendicectomía','La apendicectomía es la técnica quirúrgica por medio de la cual se extrae el apéndice (apéndice cecal, vermiforme o vermicular), habitualmente en casos de apendicitis aguda',0),('6ffd254b-2fa6-11ea-9402-ac220b26bfde','19868bd9-2fa6-11ea-9402-ac220b26bfde','Artroplastia de rodilla','En la artroplastia de rodilla , los médicos extraen el cartílago dañado y lo reemplazan con nuevas superficies articulares en un proceso por pasos.',0),('7bc69344-2fa6-11ea-9402-ac220b26bfde','210881cc-2fa6-11ea-9402-ac220b26bfde','Swan Ganz','procedimiento médico en el que se pasa una sonda delgada hasta el lado derecho del corazón con el fin de monitorizar el paso de sangre a través del corazón y vigilar la función cardíaca en pacientes muy enfermos.',0),('81304a7f-2fa6-11ea-9402-ac220b26bfde','210881cc-2fa6-11ea-9402-ac220b26bfde','Coronariografía','Proceso de diagnóstico por imagen cuya función es el estudio de los vasos que nutren al miocardio (músculo cardíaco) que no son visibles mediante la radiología convencional.',0);
/*!40000 ALTER TABLE `detail_type_of_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empty_poll`
--

DROP TABLE IF EXISTS `empty_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empty_poll` (
  `idempty_poll` varchar(60) NOT NULL,
  `iddetail_type_of_procedure` varchar(60) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(145) NOT NULL,
  `type` varchar(45) NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idempty_poll`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empty_poll`
--

LOCK TABLES `empty_poll` WRITE;
/*!40000 ALTER TABLE `empty_poll` DISABLE KEYS */;
INSERT INTO `empty_poll` VALUES ('05b01568-2fa7-11ea-9402-ac220b26bfde','6ffd254b-2fa6-11ea-9402-ac220b26bfde','WOMAC SCORE','REEMPLAZO ARTICULAR DE RODILLA','Score','2020-01-05 10:34:58',0),('1da57156-2fa7-11ea-9402-ac220b26bfde','6ffd254b-2fa6-11ea-9402-ac220b26bfde','KNEE SOCIETY SCORE – PACIENTE','(PARA SER COMPLETADO POR EL PACIENTE)','Score','2020-01-05 10:35:39',0),('219a9f8e-2fa7-11ea-9402-ac220b26bfde','6ffd254b-2fa6-11ea-9402-ac220b26bfde','KNEE SOCIETY SCORE – POSTQUIRÚRGICO','(PARA SER COMPLETADO POR EL MÉDICO)','Score','2020-01-05 10:35:45',0),('d675c7ad-2fa6-11ea-9402-ac220b26bfde','6791e5e6-2fa6-11ea-9402-ac220b26bfde','WOMAC SCORE','REEMPLAZO ARTICULAR DE RODILLA','Score','2020-01-05 10:34:41',1);
/*!40000 ALTER TABLE `empty_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idinstitution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES ('3ee639e3-3030-11ea-9402-ac220b26bfde','Sanatorio Allende','Sanatorio Allende Nueva Córdoba','Argentina','Cordoba','Cordoba','Av. Hipólito Yrigoyen 384','','',0),('4137ec07-3030-11ea-9402-ac220b26bfde','Sanatorio Allende','Sanatorio Allende Nueva Córdoba','Argentina','Cordoba','Cordoba','Av. Hipólito Yrigoyen 384','','',1),('52659f9a-3030-11ea-9402-ac220b26bfde','Hospital Italiano','Hospital Italiano Sociedad de Beneficencia','Argentina','Cordoba','Cordoba','Roma 550','','',0);
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `idpatient` varchar(60) NOT NULL,
  `idperson` varchar(60) NOT NULL,
  `notes` varchar(140) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idpatient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('15a22b80-3034-11ea-9402-ac220b26bfde','15842920-3034-11ea-9402-ac220b26bfde','El paciente tiene antecedentes de diabetes','micachuela_cvr@gmail.com',0),('7982f0bd-3034-11ea-9402-ac220b26bfde','7975368c-3034-11ea-9402-ac220b26bfde','El paciente tiene antecedentes de artrosis','ecabanilla@gmail.com',0),('84e07329-3033-11ea-9402-ac220b26bfde','84c4be20-3033-11ea-9402-ac220b26bfde','Hipertension','pp.cabanilla@gmail.com',0);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `idpermissions` varchar(60) NOT NULL,
  `permissionscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpermissions`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `idperson` varchar(60) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `birth_date` varchar(10) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idperson`),
  UNIQUE KEY `idperson_UNIQUE` (`idperson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('15842920-3034-11ea-9402-ac220b26bfde','40385210','14/11/1997','FEMENINO','Micaela','cabanilla',0),('6701483e-2f9f-11ea-9402-ac220b26bfde','371958752','09-01-1993','MASCULINO','federico','Cabanilla',1),('7975368c-3034-11ea-9402-ac220b26bfde','18015888','11/11/1997','FEMENINO','Edith','Cabanilla',0),('84c4be20-3033-11ea-9402-ac220b26bfde','16906739','14/11/1997','MASCULINO','Jose Luis','Cabanilla',0),('aa1fa286-3031-11ea-9402-ac220b26bfde','40385210','14/11/1997','FEMENINO','Micaela','cabanilla',0),('aeb64603-3031-11ea-9402-ac220b26bfde','40385210','14/11/1997','FEMENINO','Micaela','cabanilla',0),('cd7663ab-3035-11ea-9402-ac220b26bfde','37195387','09/01/1993','MASCULINO','federico','cabanilla',0);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll` (
  `idpoll` varchar(60) NOT NULL COMMENT '	',
  `iduser_author` varchar(60) NOT NULL,
  `idtype_of_poll` varchar(60) NOT NULL,
  `idempty_poll` varchar(60) NOT NULL,
  `idprocedure` varchar(60) DEFAULT NULL,
  `description` varchar(60) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idpoll`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll`
--

LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
INSERT INTO `poll` VALUES ('98b9ffa2-3079-11ea-9402-ac220b26bfde','pendiente','4b838099-306a-11ea-9402-ac220b26bfde','05b01568-2fa7-11ea-9402-ac220b26bfde','ba9f80a2-305e-11ea-9402-ac220b26bfde','Descripcion de una Poll de prueba del POST','2020-01-06 11:42:19',0),('a13b9d59-3079-11ea-9402-ac220b26bfde','pendiente','4b838099-306a-11ea-9402-ac220b26bfde','05b01568-2fa7-11ea-9402-ac220b26bfde','ba9f80a2-305e-11ea-9402-ac220b26bfde','Descripcion de una Poll de prueba del POST','2020-01-06 11:42:34',0),('a498a6ab-3079-11ea-9402-ac220b26bfde','pendiente','4b838099-306a-11ea-9402-ac220b26bfde','05b01568-2fa7-11ea-9402-ac220b26bfde','ba9f80a2-305e-11ea-9402-ac220b26bfde','Descripcion de una Poll de prueba del POST','2020-01-06 11:42:39',0);
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_detail`
--

DROP TABLE IF EXISTS `poll_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_detail` (
  `idpoll_detail` varchar(60) NOT NULL,
  `idquestion` varchar(60) NOT NULL,
  `idanswer` varchar(60) NOT NULL,
  `idpoll` varchar(60) NOT NULL,
  `erased` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idpoll_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_detail`
--

LOCK TABLES `poll_detail` WRITE;
/*!40000 ALTER TABLE `poll_detail` DISABLE KEYS */;
INSERT INTO `poll_detail` VALUES ('98c04c3b-3079-11ea-9402-ac220b26bfde','f1ca5029-2faa-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98c3d993-3079-11ea-9402-ac220b26bfde','0354809a-2fab-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98c7c31d-3079-11ea-9402-ac220b26bfde','0ccf69e2-2fab-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98cf3fa2-3079-11ea-9402-ac220b26bfde','1b168aaa-2fab-11ea-9402-ac220b26bfde','cfafabbe-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98d6d862-3079-11ea-9402-ac220b26bfde','2450a948-2fab-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98dadd7c-3079-11ea-9402-ac220b26bfde','add2dc51-2fac-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98de8e42-3079-11ea-9402-ac220b26bfde','c0f6873e-2fac-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98e27cd8-3079-11ea-9402-ac220b26bfde','e18bc2ae-2fac-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98e62d3a-3079-11ea-9402-ac220b26bfde','ee8bf938-2fac-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98ea26d4-3079-11ea-9402-ac220b26bfde','5b63c66f-2fad-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98edd0eb-3079-11ea-9402-ac220b26bfde','665a61a2-2fad-11ea-9402-ac220b26bfde','cfafabbe-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98f1c0b3-3079-11ea-9402-ac220b26bfde','6e259dd2-2fad-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98f57b2c-3079-11ea-9402-ac220b26bfde','778a61e9-2fad-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98f96a60-3079-11ea-9402-ac220b26bfde','7fedfe37-2fad-11ea-9402-ac220b26bfde','cfafabbe-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('98fd0c7d-3079-11ea-9402-ac220b26bfde','85db2e39-2fad-11ea-9402-ac220b26bfde','cfafabbe-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('9901166c-3079-11ea-9402-ac220b26bfde','8c599616-2fad-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('9904c98c-3079-11ea-9402-ac220b26bfde','92264838-2fad-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('9908c160-3079-11ea-9402-ac220b26bfde','9894ca0f-2fad-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('990c587c-3079-11ea-9402-ac220b26bfde','9d89d324-2fad-11ea-9402-ac220b26bfde','cfafabbe-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('9910462e-3079-11ea-9402-ac220b26bfde','a5840b21-2fad-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('99144aa0-3079-11ea-9402-ac220b26bfde','aabdd8e2-2fad-11ea-9402-ac220b26bfde','cfa7c196-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('9917f7a2-3079-11ea-9402-ac220b26bfde','b3bb6ef6-2fad-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('991bb1ad-3079-11ea-9402-ac220b26bfde','bb06b968-2fad-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0),('991f9dc0-3079-11ea-9402-ac220b26bfde','c19aa900-2fad-11ea-9402-ac220b26bfde','cfa01f07-2faa-11ea-9402-ac220b26bfde','98b9ffa2-3079-11ea-9402-ac220b26bfde',0);
/*!40000 ALTER TABLE `poll_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimiento`
--

DROP TABLE IF EXISTS `procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimiento` (
  `idprocedure` varchar(60) NOT NULL,
  `idinstitution` varchar(60) NOT NULL,
  `idservice` varchar(60) NOT NULL,
  `iddetail_type_of_procedure` varchar(60) NOT NULL,
  `idpatient` varchar(60) NOT NULL,
  `iduser` varchar(60) NOT NULL,
  `description` varchar(145) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idprocedure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimiento`
--

LOCK TABLES `procedimiento` WRITE;
/*!40000 ALTER TABLE `procedimiento` DISABLE KEYS */;
INSERT INTO `procedimiento` VALUES ('ba9f80a2-305e-11ea-9402-ac220b26bfde','3ee639e3-3030-11ea-9402-ac220b26bfde','607c0304-3031-11ea-9402-ac220b26bfde','6ffd254b-2fa6-11ea-9402-ac220b26bfde','15a22b80-3034-11ea-9402-ac220b26bfde','cd7d0f66-3035-11ea-9402-ac220b26bfde','Poll de prueba del POST','2020-01-06 08:30:00',0);
/*!40000 ALTER TABLE `procedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `idquestion` varchar(60) NOT NULL,
  `idtype_of_answer` varchar(60) NOT NULL,
  `idquestion_subgroup` varchar(60) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `question` varchar(400) NOT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idquestion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('0354809a-2fab-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','45207efc-2fa9-11ea-9402-ac220b26bfde',NULL,' 2 - Subiendo y bajando escaleras',0),('0ccf69e2-2fab-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','45207efc-2fa9-11ea-9402-ac220b26bfde',NULL,' 3 - Durante la noche mientras descansa',0),('1b168aaa-2fab-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','45207efc-2fa9-11ea-9402-ac220b26bfde',NULL,' 4 - Sentado o reposando',0),('2450a948-2fab-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','45207efc-2fa9-11ea-9402-ac220b26bfde',NULL,' 5 - Estando parado',0),('5b63c66f-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'3 - Levantarse de estar sentado',0),('665a61a2-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'4 - Estando parado por largo tiempo',0),('6e259dd2-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'5 - Doblado al pisoo',0),('778a61e9-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'6 - Caminando sobre una superficie plana',0),('7fedfe37-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'7 - Entrando o saliendo del auto o colectivo',0),('85db2e39-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'8 - Yendo al shopping',0),('8c599616-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'9 - Poniendose las medias o calcetines',0),('92264838-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'10 - Levantandose de la cama',0),('9894ca0f-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'11 - Sacandose las medias o calcetines',0),('9d89d324-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'12 - Acostado en la cama',0),('a5840b21-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'13 - Saliendo del baño',0),('aabdd8e2-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'14 - Sentado',0),('add2dc51-2fac-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','5bc7d3c6-2fa9-11ea-9402-ac220b26bfde',NULL,' 1 - ¿Cuan severa es tu rigidez después del primer despertar en la mañana?',0),('b3bb6ef6-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'15 - Subiendo o bajando del inodoro',0),('bb06b968-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'16 - Realizando tareas domésticas pesadas',0),('c0f6873e-2fac-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','5bc7d3c6-2fa9-11ea-9402-ac220b26bfde',NULL,' 2 - ¿Cuan severa es tu rigidez después de sentarte, acostarte o descansando en el día?',0),('c19aa900-2fad-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'17 - Realizando tareas domésticas livianas',0),('e18bc2ae-2fac-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'1 - Descender escaleras',0),('ee8bf938-2fac-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','7c87b658-2fa9-11ea-9402-ac220b26bfde',NULL,'2 - Ascender escaleras',0),('f1ca5029-2faa-11ea-9402-ac220b26bfde','cf9486f3-2faa-11ea-9402-ac220b26bfde','45207efc-2fa9-11ea-9402-ac220b26bfde',NULL,' 1 - Caminando sobre una superficie plana',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_group`
--

DROP TABLE IF EXISTS `question_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_group` (
  `idquestion_group` varchar(60) NOT NULL,
  `idempty_poll` varchar(60) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0' COMMENT '	',
  PRIMARY KEY (`idquestion_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_group`
--

LOCK TABLES `question_group` WRITE;
/*!40000 ALTER TABLE `question_group` DISABLE KEYS */;
INSERT INTO `question_group` VALUES ('52649c13-2fa8-11ea-9402-ac220b26bfde','05b01568-2fa7-11ea-9402-ac220b26bfde','A - DOLOR SEMANAL','Piense en el dolor en su rodilla en la última semana.',0),('96d083dd-2fa8-11ea-9402-ac220b26bfde','05b01568-2fa7-11ea-9402-ac220b26bfde','B - RIGIDEZ','Piensa sobre tu RIGIDEZ (no dolor) que sentiste en tu rodilla durante las últimas 48 hs. La rigidez es una sensación de disminución de la facilidad para mover la articulación.',0),('a2ca288a-2fa8-11ea-9402-ac220b26bfde','05b01568-2fa7-11ea-9402-ac220b26bfde','C - DIFICULTAD','Piense en la dificultad que tiene para realizar las siguientes actividades físicas diarias debido a su rodilla durante las últimas 48 hs. Con esto nos referimos a su capacidad para moverse y cuidarse.',0);
/*!40000 ALTER TABLE `question_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_subgroup`
--

DROP TABLE IF EXISTS `question_subgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_subgroup` (
  `idquestion_subgroup` varchar(60) NOT NULL,
  `idquestion_group` varchar(60) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(145) DEFAULT NULL,
  `max_score` tinyint(4) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idquestion_subgroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_subgroup`
--

LOCK TABLES `question_subgroup` WRITE;
/*!40000 ALTER TABLE `question_subgroup` DISABLE KEYS */;
INSERT INTO `question_subgroup` VALUES ('45207efc-2fa9-11ea-9402-ac220b26bfde','52649c13-2fa8-11ea-9402-ac220b26bfde','','¿Qué grado de dolor tienes?',NULL,0),('5bc7d3c6-2fa9-11ea-9402-ac220b26bfde','96d083dd-2fa8-11ea-9402-ac220b26bfde','','',NULL,0),('7c87b658-2fa9-11ea-9402-ac220b26bfde','a2ca288a-2fa8-11ea-9402-ac220b26bfde','','¿Qué grado de dificultad tienes?',NULL,0);
/*!40000 ALTER TABLE `question_subgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `idrole` varchar(60) NOT NULL,
  `idpermissions` varchar(60) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `idservice` varchar(60) NOT NULL,
  `service_name` varchar(45) NOT NULL,
  `description` varchar(145) NOT NULL,
  `service_code` varchar(45) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idservice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES ('607c0304-3031-11ea-9402-ac220b26bfde','Traumatologia','Servicio de traumatologia','35489','Bartolome Allende',0),('90ea572c-3030-11ea-9402-ac220b26bfde','Traumatologia','Servicio de traumatologia','35489','Bartolome Allende',1),('9565019b-3030-11ea-9402-ac220b26bfde','Traumatologia','Servicio de traumatologia','35489','Bartolome Allende',0),('a10ae542-3030-11ea-9402-ac220b26bfde','Cardiologia','Servicio de Cardiologia','35488','Eddie Moreira',0),('aeefdca5-3030-11ea-9402-ac220b26bfde','Cardiologia','Servicio de Cardiologia','35588','Melisa Quiroz',0);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_institution`
--

DROP TABLE IF EXISTS `service_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_institution` (
  `idservice_institution` varchar(60) NOT NULL,
  `idservice` varchar(60) NOT NULL,
  `idinstitution` varchar(60) NOT NULL,
  PRIMARY KEY (`idservice_institution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_institution`
--

LOCK TABLES `service_institution` WRITE;
/*!40000 ALTER TABLE `service_institution` DISABLE KEYS */;
INSERT INTO `service_institution` VALUES ('6082a1d5-3031-11ea-9402-ac220b26bfde','607c0304-3031-11ea-9402-ac220b26bfde','3ee639e3-3030-11ea-9402-ac220b26bfde'),('90f0e3ed-3030-11ea-9402-ac220b26bfde','90ea572c-3030-11ea-9402-ac220b26bfde','3ee639e3-3030-11ea-9402-ac220b26bfde'),('956ac657-3030-11ea-9402-ac220b26bfde','90ea572c-3030-11ea-9402-ac220b26bfde','3ee639e3-3030-11ea-9402-ac220b26bfde'),('a1119980-3030-11ea-9402-ac220b26bfde','a10ae542-3030-11ea-9402-ac220b26bfde','3ee639e3-3030-11ea-9402-ac220b26bfde'),('aef6b781-3030-11ea-9402-ac220b26bfde','aeefdca5-3030-11ea-9402-ac220b26bfde','52659f9a-3030-11ea-9402-ac220b26bfde');
/*!40000 ALTER TABLE `service_institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_answer`
--

DROP TABLE IF EXISTS `type_of_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_of_answer` (
  `idtype_of_answer` varchar(60) NOT NULL,
  `type_of_answer` varchar(90) NOT NULL,
  `description` varchar(145) DEFAULT NULL,
  `addable` tinyint(1) DEFAULT '0',
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtype_of_answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_answer`
--

LOCK TABLES `type_of_answer` WRITE;
/*!40000 ALTER TABLE `type_of_answer` DISABLE KEYS */;
INSERT INTO `type_of_answer` VALUES ('cf9486f3-2faa-11ea-9402-ac220b26bfde','Escala de 0 a 4','Es una escala que va desde NINGUNO hasta EXTREMO con puntuacion del 0 al 4 respectivamente',1,0);
/*!40000 ALTER TABLE `type_of_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_poll`
--

DROP TABLE IF EXISTS `type_of_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_of_poll` (
  `idtype_of_poll` varchar(60) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `erased` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idtype_of_poll`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_poll`
--

LOCK TABLES `type_of_poll` WRITE;
/*!40000 ALTER TABLE `type_of_poll` DISABLE KEYS */;
INSERT INTO `type_of_poll` VALUES ('4b838099-306a-11ea-9402-ac220b26bfde','Pre-Quirurgico',0);
/*!40000 ALTER TABLE `type_of_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_procedure`
--

DROP TABLE IF EXISTS `type_of_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_of_procedure` (
  `idtype_of_procedure` varchar(60) NOT NULL,
  `description` varchar(45) NOT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtype_of_procedure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_procedure`
--

LOCK TABLES `type_of_procedure` WRITE;
/*!40000 ALTER TABLE `type_of_procedure` DISABLE KEYS */;
INSERT INTO `type_of_procedure` VALUES ('19868bd9-2fa6-11ea-9402-ac220b26bfde','Cirugia',0),('210881cc-2fa6-11ea-9402-ac220b26bfde','Hemodinamia',0);
/*!40000 ALTER TABLE `type_of_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` varchar(60) NOT NULL,
  `idperson` varchar(60) NOT NULL,
  `idrole` varchar(60) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(160) NOT NULL,
  `email` varchar(45) NOT NULL,
  `alternative_email` varchar(45) DEFAULT NULL,
  `erased` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('67089e2b-2f9f-11ea-9402-ac220b26bfde','6701483e-2f9f-11ea-9402-ac220b26bfde',NULL,'fcabanilla','$2a$10$DWs3pv7o8yPlMwjqj87kauYXwg5RLYxKCdaHyJQemuDO3.sPbBeVm','fcabnailla@gmail.com',NULL,1,NULL),('cd7d0f66-3035-11ea-9402-ac220b26bfde','cd7663ab-3035-11ea-9402-ac220b26bfde',NULL,'fcabanilla','$2a$10$dXIz1cUKgi91ZnuJ440eT.InoXBogX6nVSk1RGwKft2uG0pw1ZXle','federico.cabanilla@gmail.com',NULL,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-06  8:43:52
