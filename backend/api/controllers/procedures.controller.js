const core = require('./core.controller.js')
const pool = require('../../database');

module.exports = {
    procedureControllerPost: core.middleware([core.logRequest, create]),
    procedureControllerGet: core.middleware([core.logRequest, getAll]),
    procedureControllerGetId: core.middleware([core.logRequest, get]),
    procedureControllerPut: core.middleware([core.logRequest, update]),
    procedureControllerDelete: core.middleware([core.logRequest, deleteProcedure]),
};



function create(req, res) {
    // res.status(200).send({ message: `El EndPoint no esta terminado` });
    const { typeOfProcedure, detailProcedure, date, institutionId, serviceId, patientId, description } = req.body;
    const newProcedure = {
        typeOfProcedure,
        detailProcedure,
        date,
        institutionId,
        serviceId,
        patientId,
        description
    };
}

function getAll(req, res) {
    res.status(200).send({ message: `El EndPoint no esta terminado` });
}

function get(req, res) {
    res.status(200).send({ message: `El EndPoint no esta terminado` });
}

function update(req, res) {
    res.status(200).send({ message: `El EndPoint no esta terminado` });
}

function deleteProcedure(req, res) {
    res.status(200).send({ message: `El EndPoint no esta terminado` });
}
