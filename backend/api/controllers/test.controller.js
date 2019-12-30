const pool = require('../../database');
const core = require('./core.controller.js')

module.exports = {
    testsControllerGet:      core.middleware([core.logRequest, getAll]),
    testsControllerPost:     core.middleware([core.logRequest, create]),
    testsControllerGetId:    core.middleware([core.logRequest, get]),
    testsControllerPutId:    core.middleware([core.logRequest, update]),
    testsControllerDelete:   core.middleware([core.logRequest, deletePlace]),
}

function getAll(req, res) {
    console.log(req.body);
    // const { title, url, description } = req.body;
    const { institutionName, displayName, country, state, city, direction, typeOfEstablishment, description } = req.body;


    const newInstitution = {
        institution_name: institutionName,
        display_name: displayName,
        country, 
        state, 
        city, 
        direction, 
        type_of_establishment: typeOfEstablishment, 
        description
    };
}
function create(req, res) {
    const { idTypeProcedure, idPatient } = req.body;

    const newTest = {
        idtype_of_procedure: idTypeProcedure,
        idPatient
    };
    const table_name = 'test_table';
    const sql = `INSERT INTO ${table_name} SET ?`;
    console.log(sql);
    pool.query(sql, [newTest], (err, result) => {
        if (err) {
            res.status(500).send({ message: 'Error en la petición' });
        } else {
            if (!result.affectedRows) {
                res.status(404).send({ message: 'El TEST no se ha guardado.' });
            } else {
                console.log('Affected ' + result.affectedRows + ' rows');
                res.status(200).send({ message: 'Se creo el TEST' });
            }
        }
    });

    console.log(req.body);
}
function get(req, res) {
    console.log(req.body);
}
function update(req, res) {
    console.log(req.body);
}
function deletePlace(req, res) {
    console.log(req.body);
}