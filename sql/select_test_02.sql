SELECT
  nombre
, apellido
, altura
, peso
, imc
, tcir.descripcion_tipo_cirugia
, tenc.descripcion_tipo_encuesta
, preg.descripcion_pregunta
/*
, res.descripcion_respuesta
, encab.descripcion_encuesta_cabecera
, cir.descripcion_cirugia
*/
FROM portal_traumato_barto.persona p
INNER JOIN paciente pa ON pa.id_persona = p.id_persona
INNER JOIN cirugia cir ON cir.id_paciente = pa.id_paciente
INNER JOIN tipo_cirugia tcir ON tcir.id_tipo_cirugia = cir.id_tipo_cirugia
INNER JOIN encuesta_cabecera encab ON encab.id_cirugia = cir.id_cirugia
INNER JOIN tipo_encuesta tenc ON tenc.id_tipo_encuesta = encab.id_tipo_encuesta
INNER JOIN encuesta_detalle endet ON endet.id_encuesta_cabecera = encab.id_encuesta_cabecera
INNER JOIN pregunta preg ON preg.id_pregunta = endet.id_pregunta
/*
INNER JOIN respuesta res ON res.id_respuesta = endet.id_respuesta
*/
WHERE nombre LIKE 'juan';