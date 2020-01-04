const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/question.model.json");

module.exports = {
    questionsControllerPost: core.middleware([core.logRequest, create]),
    questionsControllerGet: core.middleware([core.logRequest, getAll]),
    questionsControllerGetId: core.middleware([core.logRequest, get]),
    questionsControllerPut: core.middleware([core.logRequest, update]),
    questionsControllerDelete: core.middleware([core.logRequest, deleteQuestion])
};

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
    const idGroup = req.swagger.params.idGroup.value;
    const idSubgroup = req.swagger.params.idSubgroup.value;
    const { name, question, idTypeOfAnswer } = req.body;

    const newQuestion = {
        name,
        question,
        idtype_of_answer: idTypeOfAnswer,
        idquestion_subgroup: idSubgroup
    };

    try {
        const groupSubgrpupDB = await pool.query(query[0], [idGroup, idSubgroup]);
        if (!groupSubgrpupDB.length) throw {
            status: "NOT_FOUND",
            description: "El Grupo o Sub-Grupo no existe",
            code: 404
        };        
        const typeOfAnswerDB = await pool.query(query[1], [idTypeOfAnswer]);
        if (!typeOfAnswerDB.length) throw {
            status: "NOT_FOUND",
            description: "El Tipo de pregunta no existe",
            code: 404
        };
        
        let questionBD = await pool.query(query[2], [name, question, idTypeOfAnswer]);
        if (questionBD.length) throw {
            status: "DUPLICATE_ENTRY",
            description: "La pregunta ya existe",
            code: 409
        };
        const questionSaved = await pool.query(query[3], newQuestion);
        if (!questionSaved.affectedRows) throw {
            status: "NOT_SAVED",
            description: "La Pregunta no se ha guardadó",
            code: 409
        };
        res.status(201).send({ message: "Se creó la Pregunta" });
    } catch (err) {
        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const query = sql.get;
    const idGroup = req.swagger.params.idGroup.value;
    const idSubgroup = req.swagger.params.idSubgroup.value;
    try {
        const questionsDB = await pool.query(query[0], [idGroup, idSubgroup]);
        if (!questionsDB.length) throw {
            status: "NOT_FOUND",
            description: "No se encontraron Preguntas !!",
            code: 404
        };
        return res.status(200).send(questionsDB);
    } catch (err) {
        errorHandler(err, res);
    }
}
async function get(req, res) {
    const query = sql.getId;
    const idGroup = req.swagger.params.idGroup.value;
    const idSubgroup = req.swagger.params.idSubgroup.value;
    const idQuestion = req.swagger.params.idQuestion.value;

    try {
        const questionDB = await pool.query(query[0], [idGroup, idSubgroup, idQuestion]);
        if (!questionDB.length) throw {
            status: "NOT_FOUND",
            description: "No se encontró la Pregunta !!",
            code: 404
        };
        return res.status(200).send(questionDB[0]);
    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    /*
        DEBERIA CORROBORARSE QUE LA FILA (ROW DEL GET ANTERIOR) EXISTA EN LA BASE ANTES DE INSERTARLA
    */
    const query = sql.put;
    // const idGroup = req.swagger.params.idGroup.value;
    const idSubgroupOld = req.swagger.params.idSubgroup.value;
    const idQuestion = req.swagger.params.idQuestion.value;
    const { name, question, idTypeOfAnswer, idSubgroup } = req.body;

    const updateQuestion = {
        name,
        question,
        idtype_of_answer: idTypeOfAnswer,
        idquestion_subgroup: idSubgroup
    };
    try {
        const questionUpdated = await pool.query(query[0], [updateQuestion, idSubgroupOld, idQuestion]);
        if (!questionUpdated.changedRows) throw {
            status: "NOT_FOUND",
            description: "No se encontró la Pregunta",
            code: 404
        };
        res.status(200).send({ message: 'Se actualizó la Pregunta' });
    } catch (err) {
        errorHandler(err, res);
    }
}
async function deleteQuestion(req, res) {
    /*
        DEBERIA CORROBORARSE QUE LA FILA (ROW DEL GET ANTERIOR) EXISTA EN LA BASE ANTES DE INSERTARLA
    */
    const query = sql.delete;
    // const idGroup = req.swagger.params.idGroup.value;
    const idSubgroup = req.swagger.params.idSubgroup.value;
    const idQuestion = req.swagger.params.idQuestion.value;
    try {
        const questionDeleted = await pool.query(query[0], [idQuestion, idSubgroup]);
        if (!questionDeleted.changedRows) throw {
            status: "NOT_FOUND",
            description: "No se encontró la Pregunta",
            code: 404
        };
        res.status(200).send({ message: 'Se eliminó la Pregunta' });
    } catch (err) {
        errorHandler(err, res);
    }
}