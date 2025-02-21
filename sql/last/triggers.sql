DELIMITER //
CREATE TRIGGER `poll_detail_GUID` BEFORE INSERT ON `mydb`.`poll_detail`
 FOR EACH ROW begin
 SET new.idpoll_detail = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `type_of_poll_GUID` BEFORE INSERT ON `mydb`.`type_of_poll`
 FOR EACH ROW begin
 SET new.idtype_of_poll = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `empty_poll_GUID` BEFORE INSERT ON `mydb`.`empty_poll`
 FOR EACH ROW begin
 SET new.idempty_poll = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `poll_GUID` BEFORE INSERT ON `mydb`.`poll`
 FOR EACH ROW begin
 SET new.idpoll = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `type_of_answer_GUID` BEFORE INSERT ON `mydb`.`type_of_answer`
 FOR EACH ROW begin
 SET new.idtype_of_answer = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `question_GUID` BEFORE INSERT ON `mydb`.`question`
 FOR EACH ROW begin
 SET new.idquestion = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `question_group_GUID` BEFORE INSERT ON `mydb`.`question_group`
 FOR EACH ROW begin
 SET new.idquestion_group = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `question_subgroup_GUID` BEFORE INSERT ON `mydb`.`question_subgroup`
 FOR EACH ROW begin
 SET new.idquestion_subgroup = uuid();
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `answer_GUID` BEFORE INSERT ON `mydb`.`answer`
 FOR EACH ROW begin
 SET new.idanswer = uuid();
end//
DELIMITER ;

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