const core = require('./core.controller.js')
const pool = require('../../database');

module.exports = {
    
    // servicesControllerGetId: core.middleware([core.logRequest, get]),
    servicesControllerGet: core.middleware([core.logRequest, getAll]),
    servicesControllerPost: core.middleware([core.logRequest, create]),
    // servicesControllerPutId: core.middleware([core.logRequest, update]),
    // servicesControllerDelete: core.middleware([core.logRequest, deleteService])
}

function create(req, res) {
    console.log(req.body);
    const idInstitution = req.swagger.params.idInstitution.value;

    const {owner, serviceName, description, serviceCode} = req.body;
    const newService = {
        owner,
        service_name: serviceName,
        description,
        service_code: serviceCode
    }
    const sql = `
        INSERT INTO service set ?
    `;
    // Busco esa Institucion
    pool.query(`SELECT * FROM institution WHERE idinstitution = ?`, [idInstitution], function(err, result) {
        if (err) {
            res.status(500).send({ message: 'Error en la petición', err });
        } else {
            if (!result.length) {
                res.status(404).send({ message: 'No existe esa Institucion !!' });
            } else {
                // Inserto el service
                pool.query(sql, [newService], function (err) {
                    if (err) {
                        if (err === 'ER_DUP_ENTRY') {
                            res.status(500).send({ message: 'Duplicate entry' });
                        }
                        console.log('Error al crear un servicio', err);
                        res.status(500).send({ message: 'Error en la petición', err });
                    } else {
                        // Busco el ID de ese Service
                        pool.query(`SELECT * FROM service WHERE service_code = ?`, [serviceCode], function (err, service) {
                            if (err) {
                                console.log('Error al crear un servicio', err);
                                res.status(500).send({ message: 'Error en la petición.', err });
                            } else {
                                if (!service.length) {
                                    res.status(404).send({ message: 'No hay ... !!' });
                                } else {
                                    const newServiceInstitution = {
                                        idservice: service[0].idservice,
                                        idinstitution: idInstitution
                                    };
                                    // Inserto los IDs de Service e Institution en la tabla service_institution
                                    pool.query(`INSERT INTO service_institution SET ?`, [newServiceInstitution], function (err) {
                                        if (err) {
                                            console.log('Error en la petición', err);
                                            res.status(500).send({ message: 'Error en la petición', err });
                                        } else {
                                            return res.status(200).send({ message: 'Se creo el servicio asignado a una institucion' });

                                        }
                                    });
                                }
                            }
                        });
                    }
                });
            }
        }
    });
    
}

function getAll(req, res) {
    const sql = `
    SELECT *
    FROM institution i 
    INNER JOIN service_institution si ON si.idinstitution = i.idinstitution
    INNER JOIN service s ON s.idservice = si.idservice 
    WHERE p.erased = FALSE`;
    pool.query(sql, function (err, services, fields) {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!services.length) {
                res.status(404).send({ message: 'No hay Pacientes !!' });
            } else {
                return res.status(200).send({ services });
            }
        }
    });
}
/*
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