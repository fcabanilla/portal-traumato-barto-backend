DELIMITER //
CREATE TRIGGER `person_GUID` BEFORE INSERT ON `mydb`.`person`
 FOR EACH ROW begin
 SET new.idperson = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `user_GUID` BEFORE INSERT ON `mydb`.`user`
 FOR EACH ROW begin
 SET new.iduser = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `role_GUID` BEFORE INSERT ON `mydb`.`role`
 FOR EACH ROW begin
 SET new.idrole = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `patient_GUID` BEFORE INSERT ON `mydb`.`patient`
 FOR EACH ROW begin
 SET new.idpatient = uuid();
end//
DELIMITER ;
