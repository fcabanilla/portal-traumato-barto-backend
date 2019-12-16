-- MySQL Script generated by MySQL Workbench
-- dom 15 dic 2019 20:35:13 -03
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
-- Table `mydb`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`person` ;

CREATE TABLE IF NOT EXISTS `mydb`.`person` (
  `idperson` VARCHAR(140),
  `dni` VARCHAR(45) NOT NULL UNIQUE,
  `birth_date` DATE NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idperson`))
ENGINE = InnoDB;

DELIMITER //
CREATE TRIGGER `person_GUID` BEFORE INSERT ON `mydb`.`person`
 FOR EACH ROW begin
 SET new.idperson = uuid();
end//
DELIMITER ;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `iduser` VARCHAR(60) NOT NULL,
  `idperson` VARCHAR(140) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `alternative_email` VARCHAR(45) NULL,
  `erased` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`iduser`),
  INDEX `fk_user_person1_idx` (`idperson` ASC),
  CONSTRAINT `fk_user_person1`
    FOREIGN KEY (`idperson`)
    REFERENCES `mydb`.`person` (`idperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DELIMITER //
CREATE TRIGGER `user_GUID` BEFORE INSERT ON `mydb`.`user`
 FOR EACH ROW begin
 SET new.iduser = uuid();
end//
DELIMITER ;


-- -----------------------------------------------------
-- Table `mydb`.`user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_role` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user_role` (
  `iduser_role` VARCHAR(60) NOT NULL,
  `iduser` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`iduser_role`),
  INDEX `fk_user_role_user1_idx` (`iduser` ASC),
  CONSTRAINT `fk_user_role_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `mydb`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`role` ;

CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `idrole` VARCHAR(60) NOT NULL,
  `iduser_role` VARCHAR(60) NOT NULL,
  `idpermissions` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`idrole`),
  INDEX `fk_role_permissions_idx` (`idpermissions` ASC),
  INDEX `fk_role_user_role1_idx` (`iduser_role` ASC),
  CONSTRAINT `fk_role_permissions`
    FOREIGN KEY (`idpermissions`)
    REFERENCES `mydb`.`permissions` (`idpermissions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_user_role1`
    FOREIGN KEY (`iduser_role`)
    REFERENCES `mydb`.`user_role` (`iduser_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DELIMITER //
CREATE TRIGGER `role_GUID` BEFORE INSERT ON `mydb`.`role`
 FOR EACH ROW begin
 SET new.idrole = uuid();
end//
DELIMITER ;


-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`patient` ;

CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `idpatient` VARCHAR(60) NOT NULL,
  `notes` VARCHAR(140) NULL,
  `patientcol` TINYINT(1) NOT NULL DEFAULT 0,
  `idperson` VARCHAR(140) NOT NULL,
  PRIMARY KEY (`idpatient`),
  INDEX `fk_patient_person1_idx` (`idperson` ASC),
  CONSTRAINT `fk_patient_person1`
    FOREIGN KEY (`idperson`)
    REFERENCES `mydb`.`person` (`idperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DELIMITER //
CREATE TRIGGER `patient_GUID` BEFORE INSERT ON `mydb`.`patient`
 FOR EACH ROW begin
 SET new.idpatient = uuid();
end//
DELIMITER ;


-- -----------------------------------------------------
-- Table `mydb`.`institution`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`institution` ;

CREATE TABLE IF NOT EXISTS `mydb`.`institution` (
  `idinstitution` VARCHAR(60) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `direction` VARCHAR(45) NOT NULL,
  `type_of_establishment` VARCHAR(45) NULL,
  PRIMARY KEY (`idinstitution`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`detail_type_of_procedure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`detail_type_of_procedure` ;

CREATE TABLE IF NOT EXISTS `mydb`.`detail_type_of_procedure` (
  `iddetail_type_of_procedure` VARCHAR(60) NOT NULL,
  `detail` VARCHAR(45) NOT NULL,
  `description` VARCHAR(250) NULL,
  PRIMARY KEY (`iddetail_type_of_procedure`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_of_procedure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`type_of_procedure` ;

CREATE TABLE IF NOT EXISTS `mydb`.`type_of_procedure` (
  `idtype_of_procedure` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `iddetail_type_of_procedure` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idtype_of_procedure`),
  INDEX `fk_type_of_procedure_detail_type_of_procedure1_idx` (`iddetail_type_of_procedure` ASC),
  CONSTRAINT `fk_type_of_procedure_detail_type_of_procedure1`
    FOREIGN KEY (`iddetail_type_of_procedure`)
    REFERENCES `mydb`.`detail_type_of_procedure` (`iddetail_type_of_procedure`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`idtype_of_answer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`question_group` ;

CREATE TABLE IF NOT EXISTS `mydb`.`question_group` (
  `idquestion_group` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NULL,
  `max_score` TINYINT NULL,
  PRIMARY KEY (`idquestion_group`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`question` ;

CREATE TABLE IF NOT EXISTS `mydb`.`question` (
  `idquestion` VARCHAR(60) NOT NULL,
  `description` VARCHAR(60) NULL,
  `idtype_of_answer` VARCHAR(60) NOT NULL,
  `idquestion_group` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idquestion`),
  INDEX `fk_question_type_of_answer1_idx` (`idtype_of_answer` ASC),
  INDEX `fk_question_question_group1_idx` (`idquestion_group` ASC),
  CONSTRAINT `fk_question_type_of_answer1`
    FOREIGN KEY (`idtype_of_answer`)
    REFERENCES `mydb`.`type_of_answer` (`idtype_of_answer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_question_group1`
    FOREIGN KEY (`idquestion_group`)
    REFERENCES `mydb`.`question_group` (`idquestion_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`answer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`answer` (
  `idanswer` VARCHAR(60) NOT NULL,
  `description` VARCHAR(60) NOT NULL,
  `score` TINYINT NULL,
  `idtype_of_answer` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idanswer`),
  INDEX `fk_answer_type_of_answer1_idx` (`idtype_of_answer` ASC),
  CONSTRAINT `fk_answer_type_of_answer1`
    FOREIGN KEY (`idtype_of_answer`)
    REFERENCES `mydb`.`type_of_answer` (`idtype_of_answer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`poll_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`poll_detail` ;

CREATE TABLE IF NOT EXISTS `mydb`.`poll_detail` (
  `idpoll_detail` VARCHAR(60) NOT NULL,
  `idquestion` VARCHAR(60) NOT NULL,
  `idanswer` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idpoll_detail`),
  INDEX `fk_poll_detail_question1_idx` (`idquestion` ASC),
  INDEX `fk_poll_detail_answer1_idx` (`idanswer` ASC),
  CONSTRAINT `fk_poll_detail_question1`
    FOREIGN KEY (`idquestion`)
    REFERENCES `mydb`.`question` (`idquestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poll_detail_answer1`
    FOREIGN KEY (`idanswer`)
    REFERENCES `mydb`.`answer` (`idanswer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idpoll`),
  INDEX `fk_poll_user1_idx` (`iduser_author` ASC),
  INDEX `fk_poll_type_of_poll1_idx` (`idtype_of_poll` ASC),
  INDEX `fk_poll_poll_detail1_idx` (`idpoll_detail` ASC),
  CONSTRAINT `fk_poll_user1`
    FOREIGN KEY (`iduser_author`)
    REFERENCES `mydb`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poll_type_of_poll1`
    FOREIGN KEY (`idtype_of_poll`)
    REFERENCES `mydb`.`type_of_poll` (`idtype_of_poll`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poll_poll_detail1`
    FOREIGN KEY (`idpoll_detail`)
    REFERENCES `mydb`.`poll_detail` (`idpoll_detail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`procedure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`procedure` ;

CREATE TABLE IF NOT EXISTS `mydb`.`procedure` (
  `idprocedure` VARCHAR(60) NOT NULL,
  `idinstitution` VARCHAR(60) NOT NULL,
  `description` VARCHAR(45) NULL,
  `patient_idpatient` VARCHAR(60) NOT NULL,
  `idtype_of_procedure` VARCHAR(60) NOT NULL,
  `poll_idpoll` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idprocedure`),
  INDEX `fk_procedure_institution1_idx` (`idinstitution` ASC),
  INDEX `fk_procedure_patient1_idx` (`patient_idpatient` ASC),
  INDEX `fk_procedure_type_of_procedure1_idx` (`idtype_of_procedure` ASC),
  INDEX `fk_procedure_poll1_idx` (`poll_idpoll` ASC),
  CONSTRAINT `fk_procedure_institution1`
    FOREIGN KEY (`idinstitution`)
    REFERENCES `mydb`.`institution` (`idinstitution`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedure_patient1`
    FOREIGN KEY (`patient_idpatient`)
    REFERENCES `mydb`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedure_type_of_procedure1`
    FOREIGN KEY (`idtype_of_procedure`)
    REFERENCES `mydb`.`type_of_procedure` (`idtype_of_procedure`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedure_poll1`
    FOREIGN KEY (`poll_idpoll`)
    REFERENCES `mydb`.`poll` (`idpoll`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`service` ;

CREATE TABLE IF NOT EXISTS `mydb`.`service` (
  `idservice` VARCHAR(60) NOT NULL,
  `service_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `service_code` VARCHAR(45) NULL,
  PRIMARY KEY (`idservice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service_institution`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`service_institution` ;

CREATE TABLE IF NOT EXISTS `mydb`.`service_institution` (
  `idservice_institution` INT NOT NULL,
  `idservice` VARCHAR(60) NOT NULL,
  `idinstitution` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idservice_institution`),
  INDEX `fk_service_institution_service1_idx` (`idservice` ASC),
  INDEX `fk_service_institution_institution1_idx` (`idinstitution` ASC),
  CONSTRAINT `fk_service_institution_service1`
    FOREIGN KEY (`idservice`)
    REFERENCES `mydb`.`service` (`idservice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_institution_institution1`
    FOREIGN KEY (`idinstitution`)
    REFERENCES `mydb`.`institution` (`idinstitution`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
