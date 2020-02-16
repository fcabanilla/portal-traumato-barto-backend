const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/poll.model.json");
var jwt = require("jsonwebtoken");
var sharedSecret = "shh";
const { DUPLICATE_ENTRY, NOT_SAVED, NOT_FOUND, PROCEDURE_NOT_FOUND, QUESTION_ANSWER_NOT_FOUND, EMPTY_POLL_NOT_FOUND, NOT_FOUND_GET_ALL } = require("../models/poll.error.model.json");

module.exports = {
    pollsControllerPost: core.middleware([core.logRequest, create]),
    pollsControllerGet: core.middleware([core.logRequest, getAll]),
    pollsControllerGetId: core.middleware([core.logRequest, get]),
    pollsControllerPut: core.middleware([core.logRequest, update]),
    pollsControllerDelete: core.middleware([core.logRequest, deletePoll])
};

function onlyNotUndefined(tmp) {
    const notUndefinedObj = {};
    Object.keys(tmp).forEach(function (key) {
        if (!(tmp[key] === undefined)) notUndefinedObj[key] = tmp[key];
    });
    return notUndefinedObj;
}

function errorHandler(err, res) {
    if (err.status != undefined) {
        console.log(err.description);
        res.status(err.code).send({ message: err.description });
    } else {
        console.log(err);
        res.status(500).send({ message: "Error en la petición.", err });
    }
}

async function create(req, res) {
    const idProcedure = req.swagger.params.idProcedure.value;
    
    const query = sql.post;
    const { description, idEmptyPoll, typeOfPoll, pollDetails } = req.body;

    const newPoll = {
        description,
        idEmpty_Poll: idEmptyPoll,
        idProcedure,
    };

    const newTypeOfPoll = {
        description: typeOfPoll
    };
    try {
        let token = req.headers.authorization.split(' ')[1];
        token = await jwt.verify(token, sharedSecret);
        
        newPoll.idUser_Author = token.iduser;


        const procedureDB = await pool.query(query[0], idProcedure);
        if (!procedureDB.length) throw PROCEDURE_NOT_FOUND;

        const emptyPollDB = await pool.query(query[2], idEmptyPoll);
        if (!emptyPollDB.length) throw EMPTY_POLL_NOT_FOUND;

        let typeOfPollDB = await pool.query(query[3], newTypeOfPoll);

        if (!typeOfPollDB.length) {
            const typeOfPollSaved = await pool.query(query[4], newTypeOfPoll);
            if (!typeOfPollSaved.affectedRows) throw NOT_SAVED;
            typeOfPollDB = await pool.query(query[3], newTypeOfPoll);
            if (!typeOfPollDB.length) throw NOT_FOUND;
        }

        const { idtype_of_poll } = typeOfPollDB[0];
        newPoll.idtype_of_poll = idtype_of_poll;

        const pollSaved = await pool.query(query[5], newPoll);
        if (!pollSaved.affectedRows) throw NOT_SAVED;

        const pollDB = await pool.query(query[6], [description, idEmptyPoll, idProcedure, newPoll.idUser_Author, idtype_of_poll]);
        if (!pollDB.length) throw NOT_SAVED;

        const { idpoll } = pollDB[0];
        for (const pollDetail of pollDetails) {
            pollDetail.idpoll = idpoll;
            const { idAnswer, idQuestion } = pollDetail;
            const pollDetailDB = await pool.query(query[7], [idAnswer, idQuestion, idpoll]);
            if (!pollDetailDB.length) {
                const pollDetailSaved = await pool.query(query[8], pollDetail);
                if (!pollDetailSaved.affectedRows) throw NOT_SAVED;
            }
        }
        res.status(201).send({ message: "Se creo la Encuesta" });


    } catch (err) {
        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const query = sql.get;
    const idProcedure = req.swagger.params.idProcedure.value;
    const pollsDB = [];
    // let totalScore;
    try {

        const tmpPollsDB = await pool.query(query[0], idProcedure);
        if (!tmpPollsDB.length) throw NOT_FOUND_GET_ALL;

        for (const pollDB of tmpPollsDB) {
            let totalScore = 0;
            const tmpEmptyPollsDB = await pool.query(query[1], pollDB.idempty_poll);
            if (!tmpEmptyPollsDB.length) throw NOT_FOUND_GET_ALL;


            for (const emptyPollDB of tmpEmptyPollsDB) {

                const tmpEmptyPollDB = {
                    idPoll: pollDB.idpoll,
                    idProcedure: idProcedure,
                    idEmptyPoll: emptyPollDB.idempty_poll,
                    date: pollDB.date,
                    typeOfPoll: pollDB.type_of_poll_description,
                    name: emptyPollDB.name,
                    type: emptyPollDB.type,
                    description: emptyPollDB.description,
                    group: []
                };
                const tmpGroupsDB = await pool.query(query[2], tmpEmptyPollDB.idEmptyPoll);
                if (!tmpGroupsDB.length) console.log('mocaso') // throw NOT_FOUND;

                for (const groupDB of tmpGroupsDB) {
                    const tmpGroupDB = {
                        idGroup: groupDB.idquestion_group,
                        name: groupDB.name,
                        description: groupDB.description,
                        subgroup: []
                    };

                    const tmpSubgroupsDB = await pool.query(query[3], tmpGroupDB.idGroup);
                    if (!tmpSubgroupsDB.length) console.log('mocaso subgrupo') // throw NOT_FOUND;

                    for (const subgroupDB of tmpSubgroupsDB) {
                        const tmpSubgroupDB = {
                            idSubgroup: subgroupDB.idquestion_subgroup,
                            name: subgroupDB.name,
                            description: subgroupDB.description,
                            maxScore: subgroupDB.max_score,
                            pollDetail: []
                        };

                        const tmpQuestionsDB = await pool.query(query[4], tmpSubgroupDB.idSubgroup);
                        if (!tmpQuestionsDB.length) console.log('mocaso QUESION') // throw NOT_FOUND;
                        
                        for (const questionDB of tmpQuestionsDB) {
                            const tmpPollDetailDB = {
                                idQuestion: questionDB.idquestion,
                                questionName: questionDB.name,
                                question: questionDB.question
                            };

                            const tmpPollDetailsDB = await pool.query(query[5], [tmpPollDetailDB.idQuestion, tmpEmptyPollDB.idPoll ]);
                            
                            if(!tmpPollDetailsDB.length) continue //console.log('Problemas Will Robinson 1!');

                            const tmpQuestionDB = await pool.query(query[6], tmpPollDetailsDB[0].idanswer);
                            if (!tmpQuestionDB.length) continue //console.log('2 - Problemas Will Robinson 2!');

                            tmpPollDetailDB.idAnswer = tmpQuestionDB[0].idanswer;
                            tmpPollDetailDB.answer = tmpQuestionDB[0].answer;
                            tmpPollDetailDB.score = tmpQuestionDB[0].score;

                            tmpSubgroupDB.pollDetail.push(tmpPollDetailDB);
                            totalScore = totalScore + tmpPollDetailDB.score;
                        }
                        tmpGroupDB.subgroup.push(tmpSubgroupDB);

                    }
                    tmpEmptyPollDB.group.push(tmpGroupDB);
                    tmpEmptyPollDB.totalScore = totalScore;
                }
                pollsDB.push(tmpEmptyPollDB);
            }
        }
        return res.status(200).send(pollsDB);

    } catch (err) {
        errorHandler(err, res);
    }
}
async function get(req, res) {
    const query = sql.getId;
    const idPoll = req.swagger.params.idPoll.value;
    const idProcedure = req.swagger.params.idProcedure.value;

    let tmpEmptyPollDB = {};

    try {

        const tmpPollsDB = await pool.query(query[0], [idProcedure, idPoll]);
        if (!tmpPollsDB.length) throw NOT_FOUND;

        for (const pollDB of tmpPollsDB) {
            const tmpEmptyPollsDB = await pool.query(query[1], pollDB.idempty_poll);
            if (!tmpEmptyPollsDB.length) throw NOT_FOUND;


            for (const emptyPollDB of tmpEmptyPollsDB) {

                tmpEmptyPollDB = {
                    idPoll: pollDB.idpoll,
                    idProcedure: idProcedure,
                    idEmptyPoll: emptyPollDB.idempty_poll,
                    date: pollDB.date,
                    typeOfPoll: pollDB.type_of_poll_description,
                    name: emptyPollDB.name,
                    type: emptyPollDB.type,
                    description: emptyPollDB.description,
                    group: []
                };
                const tmpGroupsDB = await pool.query(query[2], tmpEmptyPollDB.idEmptyPoll);
                if (!tmpGroupsDB.length) console.log('mocaso') // throw NOT_FOUND;

                for (const groupDB of tmpGroupsDB) {
                    const tmpGroupDB = {
                        idGroup: groupDB.idquestion_group,
                        name: groupDB.name,
                        description: groupDB.description,
                        subgroup: []
                    };

                    const tmpSubgroupsDB = await pool.query(query[3], tmpGroupDB.idGroup);
                    if (!tmpSubgroupsDB.length) console.log('mocaso subgrupo') // throw NOT_FOUND;

                    for (const subgroupDB of tmpSubgroupsDB) {
                        const tmpSubgroupDB = {
                            idSubgroup: subgroupDB.idquestion_subgroup,
                            name: subgroupDB.name,
                            description: subgroupDB.description,
                            maxScore: subgroupDB.max_score,
                            pollDetail: []
                        };

                        const tmpQuestionsDB = await pool.query(query[4], tmpSubgroupDB.idSubgroup);
                        if (!tmpQuestionsDB.length) console.log('mocaso QUESION') // throw NOT_FOUND;
                        for (const questionDB of tmpQuestionsDB) {
                            const tmpPollDetailDB = {
                                idQuestion: questionDB.idquestion,
                                questionName: questionDB.name,
                                question: questionDB.question
                            };

                            const tmpPollDetailsDB = await pool.query(query[5], [tmpPollDetailDB.idQuestion, tmpEmptyPollDB.idPoll]);
                            if (!tmpPollDetailsDB.length) continue //console.log('Problemas Will Robinson!');

                            const tmpQuestionDB = await pool.query(query[6], tmpPollDetailsDB[0].idanswer);
                            if (!tmpQuestionDB.length) continue //console.log('2 - Problemas Will Robinson!');

                            tmpPollDetailDB.idAnswer = tmpQuestionDB[0].idanswer;
                            tmpPollDetailDB.answer = tmpQuestionDB[0].answer;
                            tmpPollDetailDB.score = tmpQuestionDB[0].score;

                            tmpSubgroupDB.pollDetail.push(tmpPollDetailDB);


                            // tmpSubgroupDB.questions.push(tmpQuestionDB);
                            // idQuestions.push(tmpQuestionDB.idQuestion);
                        }

                        tmpGroupDB.subgroup.push(tmpSubgroupDB);

                    }
                    tmpEmptyPollDB.group.push(tmpGroupDB);
                }
                // pollsDB.push(tmpEmptyPollDB);
            }
            return res.status(200).send(tmpEmptyPollDB);
        }

    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    const query = sql.put;
    const idPoll = req.swagger.params.idPoll.value;
    const idProcedure = req.swagger.params.idProcedure.value;
    const { description, idEmptyPoll, typeOfPoll, pollDetails } = req.body;

    let newPoll = {
        description,
        idEmpty_Poll: idEmptyPoll,
        idProcedure,
    };
    const newTypeOfPoll = {};

    newPoll = onlyNotUndefined(newPoll);

    try {
        let token = req.headers.authorization.split(' ')[1];
        token = await jwt.verify(token, sharedSecret);
        
        newPoll.idUser_Author = token.iduser;
        if (typeOfPoll)
        {
            newTypeOfPoll.description= typeOfPoll;
        }
        /* CHECK OF PROCEDURE */
        const procedureDB = await pool.query(query[0], idProcedure);
        if (!procedureDB.length) throw PROCEDURE_NOT_FOUND;
        
        /* CHECK OF EMPTY POLL */
        if (newPoll.idEmpty_Poll) {
            const emptyPollDB = await pool.query(query[2], idEmptyPoll);
            if (!emptyPollDB.length) throw EMPTY_POLL_NOT_FOUND;            
        }
        newTypeOfPoll
        /* CHECK OF TYPE OF POLL */
        if (typeOfPoll) {
            let typeOfPollDB = await pool.query(query[3], newTypeOfPoll);
    
            if (!typeOfPollDB.length) {
                const typeOfPollSaved = await pool.query(query[4], newTypeOfPoll);
                if (!typeOfPollSaved.affectedRows) throw NOT_SAVED;
                typeOfPollDB = await pool.query(query[3], newTypeOfPoll);
                if (!typeOfPollDB.length) throw NOT_FOUND;
            }    
            const { idtype_of_poll } = typeOfPollDB[0];
            newPoll.idtype_of_poll = idtype_of_poll;
        }

        const pollUpdated = await pool.query(query[5], [newPoll, idPoll]);
        if (!pollUpdated.affectedRows) throw NOT_SAVED;

        /** REPASO EN POLL_DETAIL */


        for (const pollDetail of pollDetails) {
            pollDetail.idPoll = idPoll;
            const { idAnswer, idQuestion } = pollDetail;
            const pollDetailDB = await pool.query(query[6], [idAnswer, idQuestion, idPoll]);
            if (!pollDetailDB.length) {
                const pollDetailSaved = await pool.query(query[7], pollDetail);
                if (!pollDetailSaved.affectedRows) throw NOT_SAVED;
            }else{
                const pollDetailUpdated = await pool.query(query[8], pollDetail);
                if (!pollDetailUpdated.affectedRows) throw NOT_SAVED;
            }
        }
        res.status(201).send({ message: "Se actualizo la Encuesta" });







    } catch (err) {
        errorHandler(err, res);
    }
}
async function deletePoll(req, res) {
    const query = sql.delete;
    const idPoll = req.swagger.params.idPoll.value;
    const idProcedure = req.swagger.params.idProcedure.value;
    try {
        const pollDeleted = await pool.query(query[0], [idPoll, idProcedure]);
        if(!pollDeleted.changedRows) throw NOT_FOUND;
        return res.status(200).send({ message: 'Se elimino la Encuesta' });

    } catch (err) {
        errorHandler(err, res);
    }
}