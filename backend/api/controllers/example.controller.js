const core = require("./core.controller.js");
const pool = require("../../database");

module.exports = {
    AAAAAAAAAAControllerPost: core.middleware([core.logRequest, create]),
    AAAAAAAAAAControllerGet: core.middleware([core.logRequest, getAll]),
    AAAAAAAAAAControllerGetId: core.middleware([core.logRequest, get]),
    AAAAAAAAAAControllerPut: core.middleware([core.logRequest, update]),
    AAAAAAAAAAControllerDelete: core.middleware([core.logRequest, deleteZZZZZZZZZZ])
};


async function create(req, res) {

}
async function getAll(req, res) {

}
async function get(req, res) {

}
async function update(req, res) {

}
async function deleteZZZZZZZZZZ(req, res) {

}