INSERT INTO `mydb`.`user_role`(`iduser_role`,`iduser`)VALUES(uuid(),'');

SELECT * FROM user_role;

INSERT INTO `mydb`.`role`	(`idrole`,`iduser_role`,`idpermissions`,`description`) VALUES (uuid(),'', '','ALLENDE');

INSERT INTO `mydb`.`user_role`(`iduser_role`,`iduser`)VALUES('','');