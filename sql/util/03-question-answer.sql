SELECT DISTINCT 
  q.idquestion
, a.idanswer
, q.question
, a.answer
, a.score
FROM question q
INNER JOIN type_of_answer t ON t.idtype_of_answer = q.idtype_of_answer
INNER JOIN answer a ON a.idtype_of_answer = t.idtype_of_answer
WHERE q.idquestion = '0354809a-2fab-11ea-9402-ac220b26bfde' AND a.idanswer = 'cf9c6741-2faa-11ea-9402-ac220b26bfde' AND q.erased = FALSE AND a.erased = FALSE
ORDER BY 1, 3
;
