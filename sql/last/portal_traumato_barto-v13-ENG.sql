-- MySQL Script generated by MySQL Workbench
-- mar 31 dic 2019 18:21:58 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`permissions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`permissions` (
  `idpermissions` VARCHAR(60) NOT NULL,
  `permissionscol` VARCHAR(45) NULL,
  PRIMARY KEY (`idpermissions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`role` ;

CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `idrole` VARCHAR(60) NOT NULL,
  `idpermissions` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`idrole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`person` ;

CREATE TABLE IF NOT EXISTS `mydb`.`person` (
  `idperson` VARCHAR(60) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `birth_date` VARCHAR(10) NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idperson`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC),
  UNIQUE INDEX `idperson_UNIQUE` (`idperson` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `iduser` VARCHAR(60) NOT NULL,
  `idperson` VARCHAR(60) NOT NULL,
  `idrole` VARCHAR(60) NULL DEFAULT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(160) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `alternative_email` VARCHAR(45) NULL,
  `erased` TINYINT(1) NOT NULL DEFAULT 0,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`patient` ;

CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `idpatient` VARCHAR(60) NOT NULL,
  `idperson` VARCHAR(60) NOT NULL,
  `notes` VARCHAR(140) NULL,
  `email` VARCHAR(40) NULL,
  `erased` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idpatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`institution`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`institution` ;

CREATE TABLE IF NOT EXISTS `mydb`.`institution` (
  `idinstitution` VARCHAR(60) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `display_name` VARCHAR(45) NULL,
  `country` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `direction` VARCHAR(45) NOT NULL,
  `type_of_establishment` VARCHAR(45) NULL,
  `description` VARCHAR(145) NULL,
  `erased` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idinstitution`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_of_poll`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`type_of_poll` ;

CREATE TABLE IF NOT EXISTS `mydb`.`type_of_poll` (
  `idtype_of_poll` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`idtype_of_poll`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_of_answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`type_of_answer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`type_of_answer` (
  `idtype_of_answer` VARCHAR(60) NOT NULL,
  `type_of_answer` VARCHAR(90) NOT NULL,
  `description` VARCHAR(145) NULL,
  `addable` TINYINT(1) NULL DEFAULT 0,
  `erased` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idtype_of_answer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`question_group` ;

CREATE TABLE IF NOT EXISTS `mydb`.`question_group` (
  `idquestion_group` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`idquestion_group`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question_subgroup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`question_subgroup` ;

CREATE TABLE IF NOT EXISTS `mydb`.`question_subgroup` (
  `idquestion_subgroup` VARCHAR(60) NOT NULL,
  `idquestion_group` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NULL,
  `max_score` TINYINT NULL,
  PRIMARY KEY (`idquestion_subgroup`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`question` ;

CREATE TABLE IF NOT EXISTS `mydb`.`question` (
  `idquestion` VARCHAR(60) NOT NULL,
  `idtype_of_answer` VARCHAR(60) NOT NULL,
  `idquestion_subgroup` VARCHAR(60) NOT NULL,
  `name` VARCHAR(45) NULL,
  `question` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idquestion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`answer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`answer` (
  `idanswer` VARCHAR(60) NOT NULL,
  `idtype_of_answer` VARCHAR(60) NOT NULL,
  `answer` VARCHAR(60) NOT NULL,
  `score` TINYINT NULL,
  `erased` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idanswer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`poll_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`poll_detail` ;

CREATE TABLE IF NOT EXISTS `mydb`.`poll_detail` (
  `idpoll_detail` VARCHAR(60) NOT NULL,
  `idquestion` VARCHAR(60) NOT NULL,
  `idanswer` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idpoll_detail`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`poll`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`poll` ;

CREATE TABLE IF NOT EXISTS `mydb`.`poll` (
  `idpoll` VARCHAR(60) NOT NULL COMMENT '	',
  `idpoll_detail` VARCHAR(60) NOT NULL,
  `iduser_author` VARCHAR(60) NOT NULL,
  `idtype_of_poll` VARCHAR(60) NOT NULL,
  `description` VARCHAR(60) NOT NULL,
  `create_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idpoll`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`service` ;

CREATE TABLE IF NOT EXISTS `mydb`.`service` (
  `idservice` VARCHAR(60) NOT NULL,
  `service_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(145) NOT NULL,
  `service_code` VARCHAR(45) NOT NULL,
  `owner` VARCHAR(60) NOT NULL,
  `erased` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idservice`),
  UNIQUE INDEX `service_code_UNIQUE` (`service_code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_of_procedure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`type_of_procedure` ;

CREATE TABLE IF NOT EXISTS `mydb`.`type_of_procedure` (
  `idtype_of_procedure` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `erased` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idtype_of_procedure`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`detail_type_of_procedure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`detail_type_of_procedure` ;

CREATE TABLE IF NOT EXISTS `mydb`.`detail_type_of_procedure` (
  `iddetail_type_of_procedure` VARCHAR(60) NOT NULL,
  `idtype_of_procedure` VARCHAR(60) NOT NULL,
  `detail` VARCHAR(45) NOT NULL,
  `description` VARCHAR(250) NULL,
  `erased` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`iddetail_type_of_procedure`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`procedimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`procedimiento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`procedimiento` (
  `idprocedure` VARCHAR(60) NOT NULL,
  `idinstitution` VARCHAR(60) NOT NULL,
  `idservice` VARCHAR(60) NOT NULL,
  `iddetail_type_of_procedure` VARCHAR(60) NOT NULL,
  `idpatient` VARCHAR(60) NOT NULL,
  `iduser` VARCHAR(60) NOT NULL,
  `idpoll` VARCHAR(60) NULL,
  `description` VARCHAR(145) NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `erased` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idprocedure`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service_institution`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`service_institution` ;

CREATE TABLE IF NOT EXISTS `mydb`.`service_institution` (
  `idservice_institution` VARCHAR(60) NOT NULL,
  `idservice` VARCHAR(60) NOT NULL,
  `idinstitution` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idservice_institution`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
