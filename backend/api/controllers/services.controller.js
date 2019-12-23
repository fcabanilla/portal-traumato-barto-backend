const core = require('./core.controller.js')
const pool = require('../../database');

module.exports = {
    
    servicesControllerGetId: core.middleware([core.logRequest, get]),
    servicesControllerGet: core.middleware([core.logRequest, getAll]),
    servicesControllerPost: core.middleware([core.logRequest, create]),
    servicesControllerPut: core.middleware([core.logRequest, update]),
    servicesControllerDelete: core.middleware([core.logRequest, deleteService])
}

function create(req, res) {
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
        WHERE s.erased = FALSE
        AND i.erased = FALSE
        AND i.idInstitution like ?
    `;
    const idInstitution = req.swagger.params.idInstitution.value;
    pool.query(sql, [idInstitution], function (err, services, fields) {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!services.length) {
                res.status(404).send({ message: 'No hay Servicios para la institucion, o la institution no existe !!' });
            } else {
                return res.status(200).send({ services });
            }
        }
    });
}

function get(req, res) {
    const idService = req.swagger.params.idService.value;
    const idInstitution = req.swagger.params.idInstitution.value;
    const sql = `
        SELECT *
        FROM institution i 
        INNER JOIN service_institution si ON si.idinstitution = i.idinstitution
        INNER JOIN service s ON s.idservice = si.idservice 
        WHERE s.erased = FALSE
        AND i.erased = FALSE
        AND si.idinstitution = ?
        AND si.idservice = ?
        
        `;
    pool.query(sql, [ idInstitution, idService ], function (err, service, fields) {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!service.length) {
                console.log(service);
                res.status(404).send({ message: 'No se encuentra el Servicio o la Institucion !!' });
            } else {
                console.log({ service });
                return res.status(200).send({ service });
            }
        }
    });;    
}

function update(req, res) {
    const idInstitution = req.swagger.params.idInstitution.value;
    const idService = req.swagger.params.idService.value;
    const { owner, serviceName, description, serviceCode } = req.body;
    const newService = {
        idService,
        owner,
        service_name: serviceName,
        description,
        service_code: serviceCode
    };
    const sqlUpdateService = `UPDATE service SET ? WHERE idService = ?`;
    pool.query(sqlUpdateService, [newService, idService], function(err) {
        if (err) {
            console.log(`Err:`, { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            const sqlUpdate = `UPDATE service_institution SET ? WHERE idService = ? AND idInstitution = ?`;
            newServiceInstitution = {
                idInstitution,
                idService
            };
            // Actualizo la tabla intermedia
            pool.query(sqlUpdate, [newServiceInstitution, idService, idInstitution], function (err) {
                if (err) {
                    console.log(`Err:`, { err });
                    res.status(500).send({ message: 'Error en la petición.', err });
                } else {

                    res.status(200).send({ message: 'Se actualizo el Servicio' });
                }
            });
        }
    });

}

function deleteService(req, res) {
    const idService = req.swagger.params.idService.value;
    const idInstitution = req.swagger.params.idInstitution.value;
    const sqlUpdate = `UPDATE service SET erased=TRUE WHERE idService = ?`;
    const sqlSelect = `SELECT * FROM service WHERE idService = ? AND erased = FALSE`;
    pool.query(sqlSelect, [idService], function(err, result) {
        if (err) {
            console.log("err:", { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            if (!result.length) {
                res.status(404).send({ message: 'No existe el Servicio' });
            } else {
                pool.query(sqlUpdate, [idService], function (err, result, fields) {
                    if (err) {
                        console.log(`Err:`, { err });

                        res.status(500).send({ message: 'Error en la petición.', err });
                    } else {
                        // console.log('this.sql', this.sql); //command/query
                        res.status(200).send({ message: 'El servicio se elimino.' });
                    }
                });                
            }
        }
    })

}
/*
*/