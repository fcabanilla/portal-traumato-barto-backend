const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/emptyPolls.model.json");
const { DUPLICATE_ENTRY, NOT_SAVED, NOT_FOUND, DETAIL_TYPE_PROCEDURE_NOT_FOUND, EMPTY } = require("../models/emptyPolls.error.model.json");


module.exports = {
    emptyPollsControllerPost: core.middleware([core.logRequest, create]),
    emptyPollsControllerGet: core.middleware([core.logRequest, getAll]),
    emptyPollsControllerGetId: core.middleware([core.logRequest, get]),
    emptyPollsControllerPut: core.middleware([core.logRequest, update]),
    emptyPollsControllerDelete: core.middleware([core.logRequest, deleteEmptyPoll])
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
    const query = sql.post;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;

    const { name, description, type = false } = req.body;
    const newEmptyPoll = {
        name,
        description,
        type,
        iddetail_type_of_procedure: idDetailTypeProcedure
    };
    try {
        const detailTypeProcedureDB = await pool.query(query[0], idDetailTypeProcedure);
        if (!detailTypeProcedureDB.length) throw DETAIL_TYPE_PROCEDURE_NOT_FOUND;

        const emptyPollDB = await pool.query(query[1], [name, description, type]);
        if (emptyPollDB.length) throw DUPLICATE_ENTRY;

        const emptyPollSaved = await pool.query(query[2], newEmptyPoll);
        if (!emptyPollSaved.affectedRows) throw NOT_SAVED;

        res.status(201).send({ message: "Se creó la Encuesta en Blanco" })

    } catch (err) {
        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const query = sql.get;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;

    const emptyPollsDB = [];
    const idQuestions = [];
    try {
        const tmpEmptyPollsDB = await pool.query(query[0], idDetailTypeProcedure);
        if (!tmpEmptyPollsDB.length) throw EMPTY;

        for (const emptyPollDB of tmpEmptyPollsDB) {

            const tmpEmptyPollDB = {
                idEmptyPoll: emptyPollDB.idempty_poll,
                name: emptyPollDB.name,
                type: emptyPollDB.type,
                description: emptyPollDB.description,
                group: []
            };
            const tmpGroupsDB = await pool.query(query[1], tmpEmptyPollDB.idEmptyPoll);
            if (!tmpGroupsDB.length) console.log('mocaso') // throw NOT_FOUND;

            for (const groupDB of tmpGroupsDB) {
                const tmpGroupDB = {
                    idGroup: groupDB.idquestion_group,
                    name: groupDB.name,
                    description: groupDB.description,
                    subgroup: []
                };

                const tmpSubgroupsDB = await pool.query(query[2], tmpGroupDB.idGroup);
                if (!tmpSubgroupsDB.length) console.log('mocaso subgrupo') // throw NOT_FOUND;

                for (const subgroupDB of tmpSubgroupsDB) {
                    const tmpSubgroupDB = {
                        idSubgroup: subgroupDB.idquestion_subgroup,
                        name: subgroupDB.name,
                        description: subgroupDB.description,
                        maxScore: subgroupDB.max_score,
                        typeOfAnswer: {},
                        questions: []
                    };

                    const tmpQuestionsDB = await pool.query(query[3], tmpSubgroupDB.idSubgroup);
                    if (!tmpQuestionsDB.length) console.log('mocaso QUESION') // throw NOT_FOUND;
                    for (const questionDB of tmpQuestionsDB) {
                        var tmpQuestionDB = {
                            idQuestion: questionDB.idquestion,
                            questionName: questionDB.name,
                            question: questionDB.question
                        };
                        tmpSubgroupDB.questions.push(tmpQuestionDB);
                        idQuestions.push(tmpQuestionDB.idQuestion);
                    }

                    const idTypeOfAnswerDB = await pool.query(query[4], tmpQuestionDB.idQuestion);
                    console.log('tmpSubgroupDB:', tmpSubgroupDB );
                    console.log('idTypeOfAnswerDB:', idTypeOfAnswerDB );
                    
                    if (!idTypeOfAnswerDB.length) console.log('Mocaso idTypeOfAnswer');

                    let typeOfAnswerDB = await pool.query(query[5], idTypeOfAnswerDB[0].idtype_of_answer);
                    if (!typeOfAnswerDB.length) console.log('Mocaso TypeOfAnswer');
                    typeOfAnswerDB = typeOfAnswerDB[0];

                    const tmpTypeOfAnswerDB = {
                        idTypeOfAnswer: typeOfAnswerDB.idtype_of_answer,
                        name: typeOfAnswerDB.type_of_answer,
                        description: typeOfAnswerDB.description,
                        addable: (typeOfAnswerDB.addable == 1),
                        answers: []
                    };

                    const tmpAnswersDB = await pool.query(query[6], tmpTypeOfAnswerDB.idTypeOfAnswer);
                    if (!tmpAnswersDB.length) console.log('Bardo con Answers');

                    for (const answerDB of tmpAnswersDB) {
                        const tmpAnswerDB = {
                            idAnswer: answerDB.idanswer,
                            answer: answerDB.answer,
                            score: answerDB.score
                        };
                        tmpTypeOfAnswerDB.answers.push(tmpAnswerDB);
                    }

                    tmpSubgroupDB.typeOfAnswer = tmpTypeOfAnswerDB;

                    // const tmpTypeOfAnswer = await pool.query(query[3], tmpSubgroupDB.idSubgroup)

                    tmpGroupDB.subgroup.push(tmpSubgroupDB);
                }

                tmpEmptyPollDB.group.push(tmpGroupDB);
            }
            emptyPollsDB.push(tmpEmptyPollDB);
        }

        return res.status(200).send(emptyPollsDB);

    } catch (err) {
        errorHandler(err, res);
    }
}
async function get(req, res) {
    const query = sql.getId;
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;    
    const idQuestions = [];
    try {
        const tmpEmptyPollsDB = await pool.query(query[0], [idDetailTypeProcedure, idEmptyPoll]);
        if (!tmpEmptyPollsDB.length) throw NOT_FOUND;
        
        const emptyPollDB = tmpEmptyPollsDB[0];


        const tmpEmptyPollDB = {
            idEmptyPoll: emptyPollDB.idempty_poll,
            name: emptyPollDB.name,
            type: emptyPollDB.type,
            description: emptyPollDB.description,
            group: []
        };
        const tmpGroupsDB = await pool.query(query[1], tmpEmptyPollDB.idEmptyPoll);
        if (!tmpGroupsDB.length) console.log('mocaso') // throw NOT_FOUND;

        for (const groupDB of tmpGroupsDB) {
            const tmpGroupDB = {
                idGroup: groupDB.idquestion_group,
                name: groupDB.name,
                description: groupDB.description,
                subgroup: []
            };

            const tmpSubgroupsDB = await pool.query(query[2], tmpGroupDB.idGroup);
            if (!tmpSubgroupsDB.length) console.log('mocaso subgrupo') // throw NOT_FOUND;

            for (const subgroupDB of tmpSubgroupsDB) {
                const tmpSubgroupDB = {
                    idSubgroup: subgroupDB.idquestion_subgroup,
                    name: subgroupDB.name,
                    description: subgroupDB.description,
                    maxScore: subgroupDB.max_score,
                    typeOfAnswer: {},
                    questions: []
                };

                const tmpQuestionsDB = await pool.query(query[3], tmpSubgroupDB.idSubgroup);
                if (!tmpQuestionsDB.length) console.log('mocaso QUESION') // throw NOT_FOUND;
                for (const questionDB of tmpQuestionsDB) {
                    var tmpQuestionDB = {
                        idQuestion: questionDB.idquestion,
                        questionName: questionDB.name,
                        question: questionDB.question
                    };
                    tmpSubgroupDB.questions.push(tmpQuestionDB);
                    idQuestions.push(tmpQuestionDB.idQuestion);
                }                

                const idTypeOfAnswerDB = await pool.query(query[4], tmpQuestionDB.idQuestion);
                if (!idTypeOfAnswerDB.length) console.log('Mocaso idTypeOfAnswer');

                let typeOfAnswerDB = await pool.query(query[5], idTypeOfAnswerDB[0].idtype_of_answer);
                if (!typeOfAnswerDB.length) console.log('Mocaso TypeOfAnswer');
                typeOfAnswerDB = typeOfAnswerDB[0];


                const tmpTypeOfAnswerDB = {
                    idTypeOfAnswer: typeOfAnswerDB.idtype_of_answer,
                    name: typeOfAnswerDB.type_of_answer,
                    description: typeOfAnswerDB.description,
                    addable: (typeOfAnswerDB.addable == 1),
                    answers: []
                };


                const tmpAnswersDB = await pool.query(query[6], tmpTypeOfAnswerDB.idTypeOfAnswer);
                if (!tmpAnswersDB.length) console.log('Bardo con Answers');

                for (const answerDB of tmpAnswersDB) {
                    const tmpAnswerDB = {
                        idAnswer: answerDB.idanswer,
                        answer: answerDB.answer,
                        score: answerDB.score
                    };
                    tmpTypeOfAnswerDB.answers.push(tmpAnswerDB);
                }

                tmpSubgroupDB.typeOfAnswer = tmpTypeOfAnswerDB;

                tmpGroupDB.subgroup.push(tmpSubgroupDB);
            }

            tmpEmptyPollDB.group.push(tmpGroupDB);
        }
        return res.status(200).send(tmpEmptyPollDB);

    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    const query = sql.put;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;
    const { name, description, type } = req.body;

    const tmp = {
        name,
        description,
        type,
        iddetail_type_of_procedure: idDetailTypeProcedure
    };
    const updateEmptyPoll = onlyNotUndefined(tmp);

    try {
        const detailTypeProcedureDB = await pool.query(query[0], idDetailTypeProcedure);
        if (!detailTypeProcedureDB.length) throw DETAIL_TYPE_PROCEDURE_NOT_FOUND;

        const emptyPollUpdated = await pool.query(query[1], [updateEmptyPoll, idEmptyPoll]);
        if (!emptyPollUpdated.changedRows) throw NOT_FOUND;

        return res.status(200).send({ message: 'Se Actualizó la Encuesta en Blanco' });
    } catch (err) {
        errorHandler(err, res);
    }
}
async function deleteEmptyPoll(req, res) {
    const query = sql.delete;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;

    try {
        const emptyPollDeleted = await pool.query(query[0], [idEmptyPoll, idDetailTypeProcedure]);
        if (!emptyPollDeleted.changedRows) throw NOT_FOUND;

        return res.status(200).send({ message: 'Se eliminó la Encuesta en Blanco' });
    } catch (err) {
        errorHandler(err, res);
    }
}