const core = require('./core.controller.js')
const pool = require('../../database');

module.exports = {
    detailTypeProcedureControllerPost: core.middleware([core.logRequest, create]),
    detailTypeProcedureControllerGet: core.middleware([core.logRequest, getAll]),
    detailTypeProcedureControllerGetId: core.middleware([core.logRequest, get]),
    detailTypeProcedureControllerPut: core.middleware([core.logRequest, update]),
    detailTypeProcedureControllerDelete: core.middleware([core.logRequest, deleteDetailTypeProcedure]),
};

function create(req, res) {
    // res.status(200).send({ message: `El EndPoint no esta terminado` });
    const idTypeProcedure = req.swagger.params.idTypeProcedure.value;
    const { description, detail } = req.body;
    const newDetailTypeProcedure = {
        idtype_of_procedure: idTypeProcedure,
        detail,
        description
    };
    const sql = `INSERT INTO detail_type_of_procedure SET ?`;
    pool.query(sql, [newDetailTypeProcedure], (err, result) => {
        if (err) {
            if (err === 'ER_DUP_ENTRY') {
                res.status(500).send({ message: 'Duplicate entry' });
            }
            console.log('Error al crear un servicio', err);
            res.status(500).send({ message: 'Error en la petición' });
        } else {
            if (!result.affectedRows) {
                res.status(404).send({ message: 'El Detalle del Tipo de Procedimiento no se ha guardado.' });
            } else {
                console.log('Affected ' + result.affectedRows + ' rows');
                res.status(200).send({ message: 'Se creo el Detalle de Tipo De Procedimiento' });
            }
        }
    });
}

function getAll(req, res) {
    // PENDIENTE FORMATEAR EL OBJETO DE SALIDA   
    const idTypeProcedure = req.swagger.params.idTypeProcedure.value; 
    const sql = `
            SELECT * 
            FROM mydb.detail_type_of_procedure dtop 
            WHERE dtop.erased = FALSE AND dtop.idtype_of_procedure = ?
        `;  
    pool.query(sql, [idTypeProcedure], (err, detailsTypesProcedures) => {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            if (!detailsTypesProcedures.length) {
                res.status(404).send({ message: 'No hay Detalles del Tipos De Procedimientos !!' });
            } else {
                return res.status(200).send( detailsTypesProcedures );
            }
        }
    });
}

function get(req, res) {
    // PENDIENTE FORMATEAR EL OBJETO DE SALIDA
    const idTypeProcedure = req.swagger.params.idTypeProcedure.value; 
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;
    const sql = `
        SELECT * 
        FROM mydb.detail_type_of_procedure dtop 
        WHERE dtop.erased = FALSE AND dtop.iddetail_type_of_procedure = ?
        AND dtop.idtype_of_procedure
    `;
    pool.query(sql, [idDetailTypeProcedure, idTypeProcedure], (err, detailTypeProcedure, ) => {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!detailTypeProcedure.length) {
                res.status(404).send({ message: 'No se encuentra detalle para el Tipo de Procedimiento !!' });
            } else {
                console.log({ detailTypeProcedure });
                return res.status(200).send({ detailTypeProcedure });
            }
        }
    });
}

function update(req, res) {
    // No actualizar a los que fueron borrados
    // Corroborar si existe el tipo de procedimiento antes de asignarlo
    // const idTypeProcedure = req.swagger.params.idTypeProcedure.value;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;
    const { description, detail, idTypeProcedure } = req.body;
    const newDetailTypeProcedure = {
        idtype_of_procedure: idTypeProcedure,
        detail,
        description
    };
    console.log(`New Detail ...`,newDetailTypeProcedure);
    const sql = `UPDATE detail_type_of_procedure SET ? WHERE iddetail_type_of_procedure = ?`;
    pool.query(sql, [newDetailTypeProcedure, idDetailTypeProcedure], (err, result) => {
        if (err) {
            console.log(`Err:`, { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            console.log(result);
            if (!result.changedRows) {
                res.status(404).send({ message: 'No se encontro el Detalle del Tipo de procedimiento.' });
            } else {
                console.log('changed ' + result.changedRows + ' rows');
                console.log(result.sql);
                res.status(200).send({ message: 'Se actualizo el Detalle del tipo de Procedimiento' });
            }
        }
    });
}

function deleteDetailTypeProcedure(req, res) {
    // Comprobar el tipo de procedimiento antes de eliminarlo
    const idTypeProcedure = req.swagger.params.idTypeProcedure.value;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;
    const sql = `UPDATE detail_type_of_procedure SET ERASED = TRUE WHERE iddetail_type_of_procedure = ?`;

    pool.query(sql, [idDetailTypeProcedure], (err, results) => {
        if (err) {
            console.log(`Err:`, { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            console.log(results);
            if (!results.changedRows) {
                res.status(404).send({ message: 'No se encontro el Detalle del Tipo de procedimiento.' });
            } else {
                console.log('changed ' + results.changedRows + ' rows');
                res.status(200).send({ message: 'Se elimino el Detalle del tipo de Procedimiento' });
            }
        }
    });
}
