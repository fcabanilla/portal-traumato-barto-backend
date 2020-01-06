SELECT
  per.first_name
, per.last_name
, dtop.detail
, p.description AS 'Poll Name'
, top.description AS 'Tipo de Poll'
, qg.name
, qg.description
, qs.name
, qs.description
, q.question
, a.answer
FROM poll_detail pd
INNER JOIN poll p ON p.idpoll = pd.idpoll
INNER JOIN type_of_poll top ON top.idtype_of_poll = p.idtype_of_poll
INNER JOIN procedimiento pro ON pro.idprocedure = p.idprocedure
INNER JOIN detail_type_of_procedure dtop ON dtop.iddetail_type_of_procedure  = pro.iddetail_type_of_procedure
INNER JOIN patient pat ON pat.idpatient = pro.idpatient
INNER JOIN person per ON per.idperson = pat.idperson
INNER JOIN question q ON q.idquestion = pd.idquestion
INNER JOIN question_subgroup qs ON qs.idquestion_subgroup = q.idquestion_subgroup
INNER JOIN question_group qg ON qg.idquestion_group = qs.idquestion_group
INNER JOIN answer a ON a.idanswer = pd.idanswer
;