-- TRUNCATE `portal_traumato_barto`.`persona`;
INSERT INTO portal_traumato_barto.persona VALUES(0, 'Cristhian',  'Barrios',    '35662314',  '1977-11-02', 'MASCULINO'  ),
                                                (0, 'Mauricio',   'Dirrheimer', '8314652',   '1995-01-29', 'MASCULINO'  ),                          
                                                (0, 'Dario',      'Perez',      '74332754',  '1983-11-10', 'MASCULINO'  ),                          
                                                (0, 'Juanita',    'Racca',      '6232754',   '1991-02-26', 'FEMENINO'   ),                           
                                                (0, 'Romina',     'Racca',      '83642754',  '1992-03-05', 'FEMENINO'   ),                           
                                                (0, 'Alejandro',  'Biagetti',   '28332754',  '1988-02-22', 'MASCULINO'  ),                          
                                                (0, 'Melisa',     'Quiroz',     '18332754',  '1991-12-17', 'FEMENINO'   ),                           
                                                (0, 'Luigi',      'Ligo',       '32132754',  '1973-11-04', 'MASCULINO'  ),                          
                                                (0, 'Micaela',    'Cabanilla',  '40385210',  '1976-11-09', 'FEMENINO'   ),                           
                                                (0, 'Micaela',    'Rivero',     '32196754',  '2002-10-02', 'FEMENINO'   ),
                                                (0  ,'JUAN'         ,'LORITE CORONEL'   ,'20228476' ,'1988-04-21',   'MASCULINO'),
                                                (0  ,'ALFREDO'	    ,'ROA FRANCES'      ,'9393148'  ,'2000-01-03',   'MASCULINO'),
                                                (0  ,'ALVARO'	    ,'CAÑADA MACHUCA'   ,'24777393' ,'1996-08-19',   'MASCULINO'),
                                                (0  ,'NOELIA'	    ,'ALLER COTO'       ,'47310520' ,'1975-06-16',   'FEMENINO' ),
                                                (0  ,'INMACULADA'   ,'PICON BERNAT'     ,'84401406' ,'1980-03-24',   'FEMENINO' ),
                                                (0  ,'MOHAMED'	    ,'GUERRERO GAMARRA' ,'98673736' ,'1978-05-27',   'MASCULINO'),
                                                (0  ,'MONTSERRAT'   ,'ROSSELLO CANTERO' ,'39874449' ,'2002-08-24',   'MASCULINO'),
                                                (0  ,'LUCIA'	    ,'MIÑANA ANGEL'     ,'12040828' ,'1989-11-03',   'FEMENINO' ),
                                                (0  ,'ANGELES'	    ,'HIGUERA GORDON'   ,'7346740'  ,'1972-05-15',   'FEMENINO' ),
                                                (0  ,'OLGA'	        ,'VILAS ARTEAGA'    ,'29507578' ,'1971-06-02',   'FEMENINO' ),
                                                (0  ,'JULIA'	    ,'TORRENTE MANJON'  ,'60449111' ,'1990-01-14',   'FEMENINO' )
;
                                                

-- TRUNCATE `portal_traumato_barto`.`usuario`;
INSERT INTO portal_traumato_barto.usuario VALUES(0, '1',    'cbarrios314',    '658879459dn',        'gavollink@mac.com',        'engelen@verizon.net',         0),
                                                (0, '2',    'mdirrheimer652', '511200626dhgndg',    'teverett@outlook.com',     'jaesenj@att.net',             0),
                                                (0, '3',    'dperez754',      '513463502gfnd',      'sriha@aol.com',            'mosses@gmail.com',            0),
                                                (0, '4',    'jracca754',      '346125359ngfndg',    'ahmad@icloud.com',         'cderoove@live.com',           0),
                                                (0, '5',    'rracca754',      '937630832gbndfgb',   'crusader@msn.com',         'osaru@outlook.com',           0),
                                                (0, '6',    'abiagetti754',   '999676988gbsgbs',    'curly@icloud.com',         'flaviog@outlook.com',         0),
                                                (0, '7',    'mquiroz754',     '139608765gsfbs',     'sassen@att.net',           'wikinerd@msn.com',            0),
                                                (0, '8',    'lligo754',       '762221501fdbgsf',    'zavadsky@yahoo.com',       'barjam@msn.com',              0),
                                                (0, '9',    'mcabanilla210',  '368538036sgfhb',     'jbarta@outlook.com',       'adamk@optonline.net',         0),
                                                (0, '10',   'mrivero754',     '319420025zfg',       'nimaclea@aol.com',         'chinthaka@optonline.net',     0);


-- TRUNCATE `portal_traumato_barto`.`paciente`;
INSERT INTO portal_traumato_barto.paciente VALUES   (0, 11,  101.06, 140.53, 51.17,  1,	0),
                                                    (0, 12,  50.75,  183.01, 15.15,  2,	0),
                                                    (0, 13,  53.47,  181.56, 16.22,  3,	0),
                                                    (0, 14,  47.58,  165.66, 17.34,  1,	0),
                                                    (0, 15,  76.86,  196.85, 19.83,  2,	0),
                                                    (0, 16,  93.16,  149.72, 41.56,  2,	0),
                                                    (0, 17,  53.58,  141.59, 26.73,  1,	0),
                                                    (0, 18,  117.76, 133.12, 66.45,  2,	0),
                                                    (0, 19,  110.80, 191.46, 30.23,  1,	0),
                                                    (0, 20,  68.70,  196.80, 17.74,  2,	0),
                                                    (0, 21,  69.97,  146.57, 32.57,  3,	0)
;


-- TRUNCATE `portal_traumato_barto`.`tipo_cirugia`;
INSERT INTO `portal_traumato_barto`.`tipo_cirugia` VALUES   (0, 'RODILLA'   ),
                                                            (0, 'CADERA'    ),
                                                            (0, 'HOMBRO'    )
;


-- TRUNCATE `portal_traumato_barto`.`cirugia`;
INSERT INTO `portal_traumato_barto`.`cirugia` VALUES    (0, 'SCORE-RODILLA',    1,  1),
                                                        (0, NULL,               2,  1),
                                                        (0, NULL,               3,  1),
                                                        (0, NULL,               2,  4),
                                                        (0, NULL,               1,  7),
                                                        (0, NULL,               2,  8),
                                                        (0, NULL,               1,  6),
                                                        (0, NULL,               3,  5),
                                                        (0, NULL,               2,  9)
;


-- TRUNCATE `portal_traumato_barto`.`tipo_encuesta`;
INSERT INTO `portal_traumato_barto`.`tipo_encuesta` VALUES  (0, 'PREQUIRURGICO'),
                                                            (0, 'INTRAQUIROFANO'),
                                                            (0, 'POSTQUIRURGICO')
;

-- TRUNCATE `portal_traumato_barto`.`encuesta_cabecera`;
INSERT INTO `portal_traumato_barto`.`encuesta_cabecera` VALUES  (0, 1,  1,  'posible_calculo_score'),
                                                                (0, 2,  1,  'posible_calculo_score'),
                                                                (0, 3,  1,  'posible_calculo_score'),
                                                                (0, 1,  2,  'posible_calculo_score')
;

INSERT INTO `portal_traumato_barto`.`tipo_respuesta` VALUES (0, 'NINGUNO, LEVE, MODERADO, SEVERO, EXTREMO, NINGUNO', '0, 1, 2, 3, 4'),
                                                            (0, ', , LEVE, , , MODERADO, , , , SEVERO', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10'),
                                                            (0, 'SIEMPRE, A VECES, NUNCA', '5, 3, 0'),
                                                            (0, 'MUY SATISFECHO, SATISFECHO, NEUTRAL, INSATISFECHO, MUY INSATISFECHO', '8, 6, 4, 2, 0'),
                                                            (0, 'ESTOY MUCHO PEOR DE LO QUE PENSABA, ESTOY ALGO PEOR DE LO QUE PENSABA, MIS EXPECTATIVAS SE CUMPLIERON, ESTOY UN POCO MEJOR DE LO QUE PENSABA, ESTOY MUCHO MEJOR DE LO QUE PENSABA', '1, 2, 3, 4, 5')
;



-- TRUNCATE `portal_traumato_barto`.`grupo_pregunta`;
INSERT INTO `portal_traumato_barto`.`grupo_pregunta` VALUES (0, 'WOMAC SCORE',              96  ),
                                                            (0, 'KNEE SOCIETY - PACIENTE',  100 ),
                                                            (0, 'KNEE SOCIETY - MEDICO',    2)
;

-- TRUNCATE `portal_traumato_barto`.`respuesta`;
INSERT INTO `portal_traumato_barto`.`respuesta` VALUES  (0, 1,   "NINGUNO",                                 0   ),
                                                        (0, 1,   "LEVE",                                    1   ),
                                                        (0, 1,   "MODERADO",                                2   ),
                                                        (0, 1,   "SEVERO",                                  3   ),
                                                        (0, 1,   "EXTREMO",                                 4   ),
                                                        (0, 2,   "NINGUNO",                                 0   ),
                                                        (0, 2,   "",                                        1   ),
                                                        (0, 2,   "",                                        2   ),
                                                        (0, 2,   "LEVE",                                    3   ),
                                                        (0, 2,   "",                                        4   ),
                                                        (0, 2,   "",                                        5   ),
                                                        (0, 2,   "MODERADO",                                6   ),
                                                        (0, 2,   "",                                        7   ),
                                                        (0, 2,   "",                                        8   ),
                                                        (0, 2,   "",                                        9   ),
                                                        (0, 2,   "SEVERO",                                  10  ),
                                                        (0, 3,   "SIEMPRE",                                 5   ),
                                                        (0, 3,   "A VECES",                                 3   ),
                                                        (0, 3,   "NUNCA",                                   0   ),
                                                        (0, 4,   "MUY SATISFECHO",                          8   ),
                                                        (0, 4,   "SATISFECHO",                              6   ),
                                                        (0, 4,   "NEUTRAL",                                 4   ),
                                                        (0, 4,   "INSATISFECHO",                            2   ),
                                                        (0, 4,   "MUY INSATISFECHO",                        0   ),
                                                        (0, 5,   "ESTOY MUCHO PEOR DE LO QUE PENSABA",      1   ),
                                                        (0, 5,   "ESTOY ALGO PEOR DE LO QUE PENSABA",       2   ),
                                                        (0, 5,   "MIS EXPECTATIVAS SE CUMPLIERON",          3   ),
                                                        (0, 5,   "ESTOY UN POCO MEJOR DE LO QUE PENSABA",   4   ),
                                                        (0, 5,   "ESTOY MUCHO MEJOR DE LO QUE PENSABA",     5   )
;

-- TRUNCATE `portal_traumato_barto`.`pregunta`;
INSERT INTO `portal_traumato_barto`.`pregunta`  VALUES  (0, 1, 1, '¿QUE GRADO DE DOLOR TIENE CAMINANDO SOBRE UNA SUPERFICIE PLANA?' ),
                                                        (0, 1, 1, '¿QUE GRADO DE DOLOR TIENE SUBIENDO Y BAJANDO ESCALERAS?'         ),
                                                        (0, 1, 1, '¿QUE GRADO DE DOLOR TIENE DURANTE LA NOCHE MIENTRAS DESCANSA?'   ),
                                                        (0, 1, 1, '¿QUE GRADO DE DOLOR TIENE SENTADO O REPOSANDO?'                  ),
                                                        (0, 1, 1, '¿QUE GRADO DE DOLOR TIENE ESTANDO PARADO?'                       ),
                                                        (0, 2, 2, '¿DOLOR AL CAMINAR?'                                              ),
                                                        (0, 2, 2, '¿DOLOR AL SUBIR Y BAJAR ESCALERAS?'                              ),
                                                        (0, 2, 3, '¿SIENTES NORMAL TUS RODILLAS?'                                   )
;

-- TRUNCATE `portal_traumato_barto`.`encuesta_detalle`;
INSERT INTO `portal_traumato_barto`.`encuesta_detalle` VALUES   (0, 1, 1,   1),
                                                                (0, 1, 2,   3),
                                                                (0, 1, 3,   4),
                                                                (0, 1, 4,   1),
                                                                (0, 1, 5,   2),
                                                                (0, 1, 6,   3),
                                                                (0, 1, 7,   2),
                                                                (0, 1, 8,   3),
                                                                (0, 1, 9,   4),
                                                                (0, 1, 10,  2),
                                                                (0, 1, 11,  1)
;