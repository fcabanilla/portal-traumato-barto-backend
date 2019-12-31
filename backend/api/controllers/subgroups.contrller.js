const core = require("./core.controller.js");
const pool = require("../../database");

module.exports = {
    subgroupsControllerPost: core.middleware([core.logRequest, create]),
    subgroupsControllerGet: core.middleware([core.logRequest, getAll]),
    subgroupsControllerGetId: core.middleware([core.logRequest, get]),
    subgroupsControllerPut: core.middleware([core.logRequest, update]),
    subgroupsControllerDelete: core.middleware([core.logRequest, deleteSubgroup])
};

function errorHandler(err) {
    console.log(err);
    if (err == 'ANSWER_NOT_FOUND') {
        res.status(404).send({ message: 'No se encontro el Sub-Grupo' });
    } else {
        res.status(500).send({ message: "Error en la petición.", err });
    }
}


async function create(req, res) {
    try {
        
    } catch (err) {
        errorHandler(err);
    }
}
async function getAll(req, res) {
    try {
        
    } catch (err) {
        errorHandler(err);
    }
}
async function get(req, res) {
    const idSubgroup = req.swagger.params.idSubgroup.value;
    try {
        
    } catch (err) {
        errorHandler(err);
    }
}
async function update(req, res) {
    const idSubgroup = req.swagger.params.idSubgroup.value;
    try {
        
    } catch (err) {
        errorHandler(err);
    }
}
async function deleteSubgroup(req, res) {
    const idSubgroup = req.swagger.params.idSubgroup.value;
    try {
        
    } catch (err) {
        errorHandler(err);
    }
}