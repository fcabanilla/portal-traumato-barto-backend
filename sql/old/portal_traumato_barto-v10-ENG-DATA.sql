CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.16.04.2

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
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detail_type_of_procedure`
--

LOCK TABLES `detail_type_of_procedure` WRITE;
/*!40000 ALTER TABLE `detail_type_of_procedure` DISABLE KEYS */;
INSERT INTO `detail_type_of_procedure` VALUES ('643c1f00-2a96-11ea-92fa-f8da0c66fd91','30ecf446-2a96-11ea-92fa-f8da0c66fd91','Apendicectomía','La apendicectomía es la técnica quirúrgica por medio de la cual se extrae el apéndice (apéndice cecal, vermiforme o vermicular), habitualmente en casos de apendicitis aguda',0),('7583dd48-2a96-11ea-92fa-f8da0c66fd91','36683235-2a96-11ea-92fa-f8da0c66fd91','Swan Ganz','procedimiento médico en el que se pasa una sonda delgada hasta el lado derecho del corazón con el fin de monitorizar el paso de sangre a través del corazón y vigilar la función cardíaca en pacientes muy enfermos.',0),('7a68bc01-2a96-11ea-92fa-f8da0c66fd91','36683235-2a96-11ea-92fa-f8da0c66fd91','Coronariografía','Proceso de diagnóstico por imagen cuya función es el estudio de los vasos que nutren al miocardio (músculo cardíaco) que no son visibles mediante la radiología convencional.',0);
/*!40000 ALTER TABLE `detail_type_of_procedure` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `detail_type_of_procedure_GUID` BEFORE INSERT ON `mydb`.`detail_type_of_procedure`
 FOR EACH ROW begin
 SET new.iddetail_type_of_procedure = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES ('b3323550-2a96-11ea-92fa-f8da0c66fd91','Sanatorio Allende','Sanatorio Allende Nueva Córdoba','Argentina','Cordoba','Cordoba','Av. Hipólito Yrigoyen 384','','',0),('b7d7a556-2a96-11ea-92fa-f8da0c66fd91','Hospital Italiano','Hospital Italiano Sociedad de Beneficencia','Argentina','Cordoba','Cordoba','Roma 550','','',0);
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `institution_GUID` BEFORE INSERT ON `mydb`.`institution`
 FOR EACH ROW begin
 SET new.idinstitution = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('1955a386-2a96-11ea-92fa-f8da0c66fd91','19542278-2a96-11ea-92fa-f8da0c66fd91','Hipertension','pp.cabanilla@gmail.com',0),('20790f0e-2a96-11ea-92fa-f8da0c66fd91','2078aab2-2a96-11ea-92fa-f8da0c66fd91','El paciente tiene antecedentes cardiacos','federico.cabanilla@gmail.com',0),('f061414e-2a95-11ea-92fa-f8da0c66fd91','f05fe928-2a95-11ea-92fa-f8da0c66fd91','El paciente tiene antecedentes de diabetes','micachuela_cvr@gmail.com',0);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `patient_GUID` BEFORE INSERT ON `mydb`.`patient`
 FOR EACH ROW begin
 SET new.idpatient = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('19542278-2a96-11ea-92fa-f8da0c66fd91','16906739','14/11/1997','MASCULINO','Jose Luis','Cabanilla'),('2078aab2-2a96-11ea-92fa-f8da0c66fd91','37195387','09/01/1993','MASCULINO','federico','cabanilla'),('f05fe928-2a95-11ea-92fa-f8da0c66fd91','40385210','14/11/1997','FEMENINO','Micaela','cabanilla');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `person_GUID` BEFORE INSERT ON `mydb`.`person`
 FOR EACH ROW begin
 SET new.idperson = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `poll`
--

LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `poll_detail`
--

LOCK TABLES `poll_detail` WRITE;
/*!40000 ALTER TABLE `poll_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `procedimiento`
--

LOCK TABLES `procedimiento` WRITE;
/*!40000 ALTER TABLE `procedimiento` DISABLE KEYS */;
INSERT INTO `procedimiento` VALUES ('b06a573c-2a99-11ea-92fa-f8da0c66fd91','b3323550-2a96-11ea-92fa-f8da0c66fd91','1955a386-2a96-11ea-92fa-f8da0c66fd91',NULL,'30ecf446-2a96-11ea-92fa-f8da0c66fd91',NULL,'2019-12-30 00:16:56',0);
/*!40000 ALTER TABLE `procedimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `procedure_GUID` BEFORE INSERT ON `mydb`.`procedimiento`
 FOR EACH ROW begin
 SET new.idprocedure= uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `question_group`
--

LOCK TABLES `question_group` WRITE;
/*!40000 ALTER TABLE `question_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `role_GUID` BEFORE INSERT ON `mydb`.`role`
 FOR EACH ROW begin
 SET new.idrole = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES ('d31274a6-2a96-11ea-92fa-f8da0c66fd91','Traumatologia','Servicio de traumatologia','35489','Bartolome Allende',0),('da1db157-2a96-11ea-92fa-f8da0c66fd91','Cardiologia','Servicio de Cardiologia','35488','Eddie Moreira',0),('dfe4fd86-2a96-11ea-92fa-f8da0c66fd91','Cardiologia','Servicio de Cardiologia','35588','Melisa Quiroz',0);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `service_GUID` BEFORE INSERT ON `mydb`.`service`
 FOR EACH ROW begin
 SET new.idservice = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `service_institution`
--

LOCK TABLES `service_institution` WRITE;
/*!40000 ALTER TABLE `service_institution` DISABLE KEYS */;
INSERT INTO `service_institution` VALUES ('d3132aff-2a96-11ea-92fa-f8da0c66fd91','d31274a6-2a96-11ea-92fa-f8da0c66fd91','b3323550-2a96-11ea-92fa-f8da0c66fd91'),('da1e3a47-2a96-11ea-92fa-f8da0c66fd91','da1db157-2a96-11ea-92fa-f8da0c66fd91','b3323550-2a96-11ea-92fa-f8da0c66fd91'),('dfe5db9c-2a96-11ea-92fa-f8da0c66fd91','dfe4fd86-2a96-11ea-92fa-f8da0c66fd91','b7d7a556-2a96-11ea-92fa-f8da0c66fd91');
/*!40000 ALTER TABLE `service_institution` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `service_institution_GUID` BEFORE INSERT ON `mydb`.`service_institution`
 FOR EACH ROW begin
 SET new.idservice_institution = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `type_of_answer`
--

LOCK TABLES `type_of_answer` WRITE;
/*!40000 ALTER TABLE `type_of_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_of_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type_of_poll`
--

LOCK TABLES `type_of_poll` WRITE;
/*!40000 ALTER TABLE `type_of_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_of_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type_of_procedure`
--

LOCK TABLES `type_of_procedure` WRITE;
/*!40000 ALTER TABLE `type_of_procedure` DISABLE KEYS */;
INSERT INTO `type_of_procedure` VALUES ('30ecf446-2a96-11ea-92fa-f8da0c66fd91','Cirugia',0),('36683235-2a96-11ea-92fa-f8da0c66fd91','Hemodinamia',0);
/*!40000 ALTER TABLE `type_of_procedure` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `type_of_procedure_GUID` BEFORE INSERT ON `mydb`.`type_of_procedure`
 FOR EACH ROW begin
 SET new.idtype_of_procedure = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_GUID` BEFORE INSERT ON `mydb`.`user`
 FOR EACH ROW begin
 SET new.iduser = uuid();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-29 23:11:39
