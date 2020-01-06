const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/poll.model.json");
const { DUPLICATE_ENTRY, NOT_SAVED, NOT_FOUND, PROCEDURE_NOT_FOUND, QUESTION_ANSWER_NOT_FOUND, EMPTY_POLL_NOT_FOUND } = require("../models/poll.error.model.json");

module.exports = {
    pollsControllerPost:    core.middleware([core.logRequest, create]),
    pollsControllerGet:     core.middleware([core.logRequest, getAll]),
    pollsControllerGetId:   core.middleware([core.logRequest, get]),
    pollsControllerPut:     core.middleware([core.logRequest, update]),
    pollsControllerDelete:  core.middleware([core.logRequest, deletePoll])
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
    const { description, idEmptyPoll, typeOfPoll, pollDetails, idQuestion, idAnswer } = req.body;
    
    
    // const newPollDetail = {
    //     idQuestion,
    //     idAnswer
    // };
    const newPoll = {
        description,
        idEmpty_Poll: idEmptyPoll,
        idProcedure,
        idUser_Author: 'pendiente'
    };

    const newTypeOfPoll = {
        description: typeOfPoll
    };
    try {

        const procedureDB = await pool.query(query[0], idProcedure);
        // console.log('procedureDB', procedureDB);
        if(!procedureDB.length) throw PROCEDURE_NOT_FOUND;

        // const questionAnswerDB = await pool.query(query[1], [idQuestion, idAnswer]);
        // console.log('questionAnswerDB', questionAnswerDB);
        // if(!questionAnswerDB.length) throw QUESTION_ANSWER_NOT_FOUND;

        const emptyPollDB = await pool.query(query[2], idEmptyPoll);
        // console.log('emptyPollDB', emptyPollDB);
        if (!emptyPollDB.length) throw EMPTY_POLL_NOT_FOUND;

        /* PENDIENTE COMPROBAR SI EXISTE UNA POLL IDENTICA A LA QUE VAMOS A INSERTAR */

        const typeOfPollDB = await pool.query(query[3], newTypeOfPoll);
        // console.log('****', typeOfPollDB);
        
        if (!typeOfPollDB.length){
            const typeOfPollSaved = await pool.query(query[4], newTypeOfPoll);
            if (!typeOfPollSaved.affectedRows) throw NOT_SAVED;
            const typeOfPollDB = await pool.query(query[3], newTypeOfPoll);
            if (!typeOfPollDB.length) throw NOT_FOUND;
        }
        
        const { idtype_of_poll } = typeOfPollDB[0];
        newPoll.idtype_of_poll = idtype_of_poll;
        // console.log(newPoll);

        const pollSaved = await pool.query(query[5], newPoll);
        if (!pollSaved.affectedRows) throw NOT_SAVED;

        const pollDB = await pool.query(query[6], [description, idEmptyPoll, idProcedure, newPoll.idUser_Author, idtype_of_poll]);
        if (!pollDB.length) throw NOT_SAVED;
        // console.log({pollDB});
        
        const { idpoll } = pollDB[0];
        for (const pollDetail of pollDetails) {
            pollDetail.idpoll = idpoll;            
            const { idAnswer, idQuestion } = pollDetail;
            const pollDetailDB = await pool.query(query[7], [idAnswer, idQuestion, idpoll]);
            if (!pollDetailDB.length) {
                const pollDetailSaved = await pool.query(query[8], pollDetail);
                if (!pollDetailSaved.affectedRows) throw NOT_SAVED;
                // console.log('creacion Nueva');
            }            
        }
        res.status(201).send({ message: "Se creo la Encuesta" });


    } catch (err) {
        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const query = sql.get;
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}
async function get(req, res) {
    const query = sql.getId;
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    const query = sql.put;
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}
async function deletePoll(req, res) {
    const query = sql.delete;
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}