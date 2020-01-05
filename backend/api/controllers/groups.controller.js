const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/groups.model.json");
const { DUPLICATE_ENTRY, NOT_SAVED, NOT_FOUND, EMPTY_POLL_NOT_FOUND } = require("../models/groups.error.model.json");

module.exports = {
    groupsControllerPost: core.middleware([core.logRequest, create]),
    groupsControllerGet: core.middleware([core.logRequest, getAll]),
    groupsControllerGetId: core.middleware([core.logRequest, get]),
    groupsControllerPut: core.middleware([core.logRequest, update]),
    groupsControllerDelete: core.middleware([core.logRequest, deleteGroup])
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
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;

    const { name, description } = req.body;
    const newGroup ={
        name,
        description,
        idempty_poll: idEmptyPoll
    };
    const query = sql.post;
    
    try {

        const emptyPollDB = await pool.query(query[0], idEmptyPoll);
        if (!emptyPollDB.length) throw EMPTY_POLL_NOT_FOUND;

        const groupDB = await pool.query(query[1], [name, description]);
        if (groupDB.length) throw DUPLICATE_ENTRY;

        const groupInserted = await pool.query(query[2], newGroup);

        if (!groupInserted.affectedRows) throw NOT_SAVED;
        
        res.status(201).send({ message: "Se creó el Grupo"});
    } catch (err) {
        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;

    const query = sql.get;
    try {
        const groupsDB = await pool.query(query[0], idEmptyPoll);
        
        if (!groupsDB.length) throw NOT_FOUND;

        console.log(groupsDB);
        return res.status(200).send(groupsDB);
    } catch (err) {
        errorHandler(err, res);
    }

}
async function get(req, res) {
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;

    const idGroup = req.swagger.params.idGroup.value;
    const query = sql.getId;
    try {
        groupDB = await pool.query(query[0], idGroup);
        if(!groupDB.length) throw{
            status: "NOT_FOUND",
            description: "No se encontró el Grupo",
            code: 404
        };
        console.log(groupDB);
        return res.status(200).send(groupDB[0]);

    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;

    const idGroup = req.swagger.params.idGroup.value;
    const { name, description } = req.body;
    const query = sql.put;
    const updateGroup ={
        name,
        description
    };
    try {
        const groupUpdated = await pool.query(query[0], [updateGroup, idGroup]);
        if (!groupUpdated.changedRows) throw {
            status: "NOT_FOUND",
            description: "No se encontró el Grupo",
            code: 404
        };
        res.status(200).send({ message: 'Se actualizó el Grupo' });
    } catch (err) {
        errorHandler(err, res);
    }
}
async function deleteGroup(req, res) {
    const idEmptyPoll = req.swagger.params.idEmptyPoll.value;

    const idGroup = req.swagger.params.idGroup.value;
    const query = sql.delete;
    try {
        const groupDeleted = await pool.query(query[0], idGroup);
        if (!groupUpdated.changedRows) throw {
            status: "NOT_FOUND",
            description: "No se encontró el Grupo",
            code: 404
        };
        res.status(200).send({ message: 'Se eliminó el Grupo' });
    } catch (err) {
        errorHandler(err, res);
    }
}