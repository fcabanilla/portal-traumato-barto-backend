const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/emptyPolls.model.json");
const { DUPLICATE_ENTRY, NOT_SAVED, NOT_FOUND } = require("../models/emptyPolls.error.model.json");


module.exports = {
    emptyPollsControllerPost:   core.middleware([core.logRequest, create]),
    emptyPollsControllerGet:    core.middleware([core.logRequest, getAll]),
    emptyPollsControllerGetId:  core.middleware([core.logRequest, get]),
    emptyPollsControllerPut:    core.middleware([core.logRequest, update]),
    emptyPollsControllerDelete: core.middleware([core.logRequest, deleteEmptyPoll])
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
    const { name, description, type } = req.body;
    const newEmptyPoll = {
        name,
        description,
        type
    };
    try {
        const emptyPollDB = await pool.query(query[0], [ name, description, type ]);
        if(emptyPollDB.length) throw DUPLICATE_ENTRY;

        const emptyPollSaved = await pool.query(query[1], newEmptyPoll);
        if(!emptyPollSaved.affectedRows) throw NOT_SAVED;

        res.status(201).send({message: "Se creó la Encuesta en Blanco"})

    } catch (err) {
        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const query = sql.get;
    try {
        const emptyPollsDB = await pool.query(query[0]);
        if(!emptyPollsDB.length) throw NOT_FOUND;

        return res.status(200).send(emptyPollsDB);
        
    } catch (err) {
        errorHandler(err, res);
    }
}
async function get(req, res) {
    const query = sql.getId;
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;
    try {
        const emptyPollDB = await pool.query(query[0], idEmptyPoll);
        if(!emptyPollDB.length) throw NOT_FOUND;

        return res.status(200).send(emptyPollDB[0]);
    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    const query = sql.put;
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;
    const { name, description, type } = req.body;
    const updateEmptyPoll = {
        name,
        description,
        type
    };
    try {
        const emptyPollUpdated = await pool.query(query[0], [updateEmptyPoll, idEmptyPoll]);
        if(!emptyPollUpdated.changedRows) throw NOT_FOUND;
        
        return res.status(200).send({ message: 'Se Actualizó la Encuesta en Blanco' });
    } catch (err) {
        errorHandler(err, res);
    }
}
async function deleteEmptyPoll(req, res) {
    const query = sql.delete;
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;

    try {
        const emptyPollDeleted = await pool.query(query[0], idEmptyPoll);
        if (!emptyPollDeleted.changedRows) throw NOT_FOUND;

        return res.status(200).send({ message: 'Se eliminó la Encuesta en Blanco' });
    } catch (err) {
        errorHandler(err, res);
    }
}