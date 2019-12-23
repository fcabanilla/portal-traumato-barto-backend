const core = require('./core.controller.js')
const pool = require('../../database');

module.exports = {
    // servicesControllerGetId: core.middleware([core.logRequest, get]),
    // servicesControllerGet: core.middleware([core.logRequest, getAll]),
    institutionsControllerPost: core.middleware([core.logRequest, create]),
    // servicesControllerPutId: core.middleware([core.logRequest, update]),
    // servicesControllerDelete: core.middleware([core.logRequest, deleteService])
}

function create(req, res) {
    console.log(req.body);
    const {institutionName, displayName, country, state, city, direction, description, typeOfEstablishment} = req.body;
    const newService = {
        name: institutionName, 
        display_name: displayName, 
        country, 
        state, 
        city, 
        direction, 
        description, 
        type_of_establishment: typeOfEstablishment
    }
    const sql = `
        INSERT INTO institution set ?
    `;
    pool.query(sql, [newService], function (err, result, fields) {
        if (err) {
            if (err === 'ER_DUP_ENTRY') {
                res.status(500).send({ message: 'Duplicate entry' });
            }
            console.log('Error al crear un servicio', err);
            res.status(500).send({ message: 'Error en la petición' });
        } else {
            res.status(200).send({ message: 'Se creo la Institucion' });
        }
    });
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