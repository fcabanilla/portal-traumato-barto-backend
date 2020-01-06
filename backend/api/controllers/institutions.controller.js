const core = require('./core.controller.js')
const pool = require('../../database');

module.exports = {
    institutionsControllerGetId: core.middleware([core.logRequest, get]),    
    institutionsControllerGet: core.middleware([core.logRequest, getAll]),
    institutionsControllerPost: core.middleware([core.logRequest, create]),
    institutionsControllerDelete: core.middleware([core.logRequest, deleteInstitution]),
    institutionsControllerPut: core.middleware([core.logRequest, update]),
}

function create(req, res) {
    console.log(req.body);
    const {institutionName, displayName, country, state, city, direction, description, typeOfEstablishment} = req.body;
    const newInstitution = {
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
    pool.query(sql, [newInstitution], function (err, result, fields) {
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

function getAll(req, res) {
    const sql = `SELECT * FROM institution i WHERE i.erased = FALSE`;
    pool.query(sql, function (err, institutions, fields) {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' , err});
        } else {
            if (!institutions.length) {
                res.status(404).send({ message: 'No hay Instituciones !!' });
            } else {
                return res.status(200).send( institutions );
            }
        }
    });   
}

function get(req, res) {
    const idInstitution = req.swagger.params.idInstitution.value;
    const sql = `SELECT * FROM institution i WHERE i.idInstitution = ? AND i.erased = FALSE`;
    pool.query(sql, [idInstitution], function (err, institution, fields) {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!institution.length) {
                res.status(404).send({ message: 'No se encuentra el Paciente !!' });
            } else {
                console.log({ institution });
                return res.status(200).send({ institution });
            }
        }
    });
}

function update(req, res) {
    const idInstitution = req.swagger.params.idInstitution.value;
    const { institutionName, displayName, country, state, city, direction, description, typeOfEstablishment } = req.body;
    const newInstitution = {
        idInstitution,
        name: institutionName,
        display_name: displayName,
        country,
        state,
        city,
        direction,
        description,
        type_of_establishment: typeOfEstablishment
    };
    const sql = `UPDATE institution SET ? WHERE idInstitution = ?`;
    pool.query(sql, [newInstitution, newInstitution.idInstitution], function(err) {
        if (err) {
            console.log(`Err:`, { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            res.status(200).send({ message: 'Se actualizo la Institucion' });
        }
    })

}

function deleteInstitution(req, res) {
    const idInstitution = req.swagger.params.idInstitution.value;
    const sql = `UPDATE institution SET erased = TRUE WHERE idInstitution = ?`;
    pool.query(sql, [idInstitution], function(err) {
        if (err) {
            console.log(`Err:`, { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            res.status(200).send({ message: 'La institucion se elimino.' });
        }
    });
}