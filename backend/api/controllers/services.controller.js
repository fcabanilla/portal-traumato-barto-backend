const core = require('./core.controller.js')

module.exports = {
    
    // servicesControllerGetId: core.middleware([core.logRequest, get]),
    // servicesControllerGet: core.middleware([core.logRequest, getAll]),
    servicesControllerPost: core.middleware([core.logRequest, create]),
    // servicesControllerPutId: core.middleware([core.logRequest, update]),
    // servicesControllerDelete: core.middleware([core.logRequest, deleteService])
}

function create(req, res) {
    console.log(req.body);
    return res.send(200);
}
/*
function getAll(req, res) {
    console.log(req.body);
    return res.send(200);    
}

function get(req, res) {
    console.log(req.body);
    return res.send(200);    
}

function update(req, res) {
    console.log(req.body);
    return res.send(200);    
}

function deleteService(req, res) {
    console.log(req.body);
    return res.send(200);    
}
*/