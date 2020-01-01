const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/groups.model.json");

module.exports = {
    groupsControllerPost: core.middleware([core.logRequest, create]),
    groupsControllerGet: core.middleware([core.logRequest, getAll]),
    groupsControllerGetId: core.middleware([core.logRequest, get]),
    groupsControllerPut: core.middleware([core.logRequest, update]),
    groupsControllerDelete: core.middleware([core.logRequest, deleteGroup])
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
    const { name, description } = req.body;
    const newGroup ={
        name,
        description
    };
    const query = sql.post;
    
    try {
        let groupDB = await pool.query(query[0], [name, description]);
        if (groupDB.length) throw {
            status: "DUPLICATE_ENTRY",
            description: "El Grupo ya existe",
            code: 409
        };

        const groupInserted = await pool.query(query[1], newGroup);

        if (!groupInserted.affectedRows) throw {
            status: "NOT_SAVED",
            description: "El Grupo no se ha guardado",
            code: 409
        };
        res.status(201).send({ message: "Se creo el Grupo"});
    } catch (err) {
        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const query = sql.get;
    try {
        const groupsDB = await pool.query(query[0]);
        
        if (!groupsDB.length) throw {
            status: "NOT_FOUND",
            description: "No hay Grupos !!",
            code: 404
        };
        console.log(groupsDB);
        return res.status(200).send(groupsDB);
    } catch (err) {
        errorHandler(err, res);
    }

}
async function get(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    const { name, description } = req.body;
    const newGroup ={
        name,
        description
    };
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}
async function deleteGroup(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}