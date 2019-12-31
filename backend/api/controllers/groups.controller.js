const core = require("./core.controller.js");
const pool = require("../../database");

module.exports = {
    groupsControllerPost: core.middleware([core.logRequest, create]),
    groupsControllerGet: core.middleware([core.logRequest, getAll]),
    groupsControllerGetId: core.middleware([core.logRequest, get]),
    groupsControllerPut: core.middleware([core.logRequest, update]),
    groupsControllerDelete: core.middleware([core.logRequest, deleteGroup])
};

function errorHandler(err) {
    console.log(err);
    if (err == 'ANSWER_NOT_FOUND') {
        res.status(404).send({ message: 'No se encontro el Grupo' });
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
    const idGroup = req.swagger.params.idGroup.value;
    try {

    } catch (err) {
        errorHandler(err);
    }
}
async function update(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    try {

    } catch (err) {
        errorHandler(err);
    }
}
async function deleteGroup(req, res) {
    const idGroup = req.swagger.params.idGroup.value;
    try {

    } catch (err) {
        errorHandler(err);
    }
}