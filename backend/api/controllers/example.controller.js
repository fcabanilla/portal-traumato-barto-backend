const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/example.model.json");

module.exports = {
    AAAAAAAAAAControllerPost: core.middleware([core.logRequest, create]),
    AAAAAAAAAAControllerGet: core.middleware([core.logRequest, getAll]),
    AAAAAAAAAAControllerGetId: core.middleware([core.logRequest, get]),
    AAAAAAAAAAControllerPut: core.middleware([core.logRequest, update]),
    AAAAAAAAAAControllerDelete: core.middleware([core.logRequest, deleteZZZZZZZZZZ])
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
    try {
        
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
async function deleteZZZZZZZZZZ(req, res) {
    const query = sql.delete;
    try {
        
    } catch (err) {
        errorHandler(err, res);
    }
}