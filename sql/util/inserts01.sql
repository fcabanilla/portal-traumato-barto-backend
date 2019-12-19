INSERT INTO `mydb`.`user_role`	(`iduser_role`	,`iduser`								)
						VALUES	(uuid()			,'7463223c-2157-11ea-97be-ac220b26bfde'	);

-- SELECT * FROM user_role;

INSERT INTO `mydb`.`permissions`(`idpermissions`,`permissionscol`	)
						VALUES	(uuid()			,'FULL'				);

SELECT * FROM permissions;

INSERT INTO `mydb`.`role`	(`idrole`	,`iduser_role`							,`idpermissions`						,`description`	)
					VALUES 	(uuid()		, 'cfdd109e-215b-11ea-97be-ac220b26bfde', '1eddac02-215c-11ea-97be-ac220b26bfde','ALLENDE'		);

INSERT INTO `mydb`.`user_role`(`iduser_role`,`iduser`)
						VALUES(UUID()		,);



