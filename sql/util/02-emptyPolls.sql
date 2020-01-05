SELECT DISTINCT
  ep.name AS 'Poll Name'
, ep.description AS 'Poll Description'
, ep.type AS 'Poll Type'
, qg.name AS 'Group Name'
, qg.description AS 'Group Description'
-- , sqg.name AS 'Sub-Group Name'
, sqg.description AS 'Sub-Group Description'
-- , q.name AS 'Question Name'
, q.question AS 'Question'
, a.answer AS 'Answer'
, a.score AS 'Score'
FROM empty_poll ep
INNER JOIN question_group qg ON qg.idempty_poll = ep.idempty_poll
INNER JOIN question_subgroup sqg ON sqg.idquestion_group = qg.idquestion_group
INNER JOIN question q ON q.idquestion_subgroup = sqg.idquestion_subgroup
INNER JOIN type_of_answer tof ON tof.idtype_of_answer = q.idtype_of_answer
INNER JOIN answer a ON a.idtype_of_answer = tof.idtype_of_answer
WHERE ep.erased = FALSE
ORDER BY 4, 7, 9;