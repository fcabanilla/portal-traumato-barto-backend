DELIMITER //
CREATE TRIGGER `person_GUID` BEFORE INSERT ON `mydb`.`person`
 FOR EACH ROW begin
 SET new.idperson = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `procedure_GUID` BEFORE INSERT ON `mydb`.`procedimiento`
 FOR EACH ROW begin
 SET new.idprocedure= uuid();
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

DELIMITER //
CREATE TRIGGER `service_GUID` BEFORE INSERT ON `mydb`.`service`
 FOR EACH ROW begin
 SET new.idservice = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `institution_GUID` BEFORE INSERT ON `mydb`.`institution`
 FOR EACH ROW begin
 SET new.idinstitution = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `service_institution_GUID` BEFORE INSERT ON `mydb`.`service_institution`
 FOR EACH ROW begin
 SET new.idservice_institution = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `type_of_procedure_GUID` BEFORE INSERT ON `mydb`.`type_of_procedure`
 FOR EACH ROW begin
 SET new.idtype_of_procedure = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `detail_type_of_procedure_GUID` BEFORE INSERT ON `mydb`.`detail_type_of_procedure`
 FOR EACH ROW begin
 SET new.iddetail_type_of_procedure = uuid();
end//
DELIMITER ;