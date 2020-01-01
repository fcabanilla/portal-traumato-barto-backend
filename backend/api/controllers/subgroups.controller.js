const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/subgroups.model.json");

module.exports = {
    subgroupsControllerPost: core.middleware([core.logRequest, create]),
    subgroupsControllerGet: core.middleware([core.logRequest, getAll]),
    subgroupsControllerGetId: core.middleware([core.logRequest, get]),
    subgroupsControllerPut: core.middleware([core.logRequest, update]),
    subgroupsControllerDelete: core.middleware([core.logRequest, deleteSubgroup])
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
    const idGroup = req.swagger.params.idGroup.value;
    const { name, description } = req.body;
    
    const newSubgroup = {
        idquestion_group: idGroup,
        name,
        description
    };
    const query = sql.post;

    try {
        const groupDB = await pool.query(query[0], idGroup);
        if (!groupDB.length) throw {
            status: "NOT_FOUND",
            description: "El Grupo no existe",
            code: 404
        };
        let subgroupBD = await pool.query(query[1], [name, description]);
        if (subgroupBD.length) throw {
            status: "DUPLICATE_ENTRY",
            description: "El Sub-Grupo ya existe",
            code: 409
        };
        
        const groupInserted = await pool.query(query[2], newSubgroup);
        if (!groupInserted.affectedRows) throw {
            status: "NOT_SAVED",
            description: "El Sub-Grupo no se ha guardado",
            code: 409
        };
        // const tmp = await pool.query('SELECT * FROM ') 
        res.status(201).send({ message: "Se creo el Sub-Grupo" });
    } catch (err) {
        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    const query = sql.get;
    try {
        console.log("SSSSSSS",idGroup);
        const subgroupsDB = await pool.query(query[0], idGroup);
        console.log("SSSSSSS",subgroupsDB);
        
        if (!subgroupsDB.length) throw {
            status: "NOT_FOUND",
            description: "No hay Sub-Grupos !!",
            code: 404
        };
        console.log(subgroupsDB);
        return res.status(200).send(subgroupsDB);
    } catch (err) {
        errorHandler(err, res);
    }
}
async function get(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    const idSubgroup = req.swagger.params.idSubgroup.value;
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    const idSubgroup = req.swagger.params.idSubgroup.value;
    const { name, description } = req.body;
    const newSubgroup = {
        name,
        description
    };
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}
async function deleteSubgroup(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    const idSubgroup = req.swagger.params.idSubgroup.value;
    try {

    } catch (err) {
        errorHandler(err, res);
    }
}