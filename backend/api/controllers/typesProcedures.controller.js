const core = require('./core.controller.js')
const pool = require('../../database');

module.exports = {
    typeProcedureControllerPost: core.middleware([core.logRequest, create]),
    typeProcedureControllerGet: core.middleware([core.logRequest, getAll]),
    typeProcedureControllerGetId: core.middleware([core.logRequest, get]),
    typeProcedureControllerPut: core.middleware([core.logRequest, update]),
    typeProcedureControllerDelete: core.middleware([core.logRequest, deleteTypeProcedure]),
};

function create(req, res) {
    // res.status(200).send({ message: `El EndPoint no esta terminado` });
    const { typeOfProcedure } = req.body;
    const newTypeProcedure = {
        description: typeOfProcedure
    };
    const sql = `INSERT INTO type_of_procedure SET ?`;
    pool.query(sql, [newTypeProcedure], (err, result) => {
        if (err) {
            if (err === 'ER_DUP_ENTRY') {
                res.status(500).send({ message: 'Duplicate entry' });
            }
            console.log('Error al crear un servicio', err);
            res.status(500).send({ message: 'Error en la petición' });
        } else {
            if (!result.affectedRows) {
                res.status(404).send({ message: 'El Tipo de Procedimiento no se ha guardado.' });
            } else {
                console.log('Affected ' + result.affectedRows + ' rows');
                res.status(200).send({ message: 'Se creo la el Tipo De Procedimiento' });
            }
        }
    });
}

function getAll(req, res) {
    // PENDIENTE FORMATEAR EL OBJETO DE SALIDA    
    const sql = `
            SELECT * 
            FROM mydb.type_of_procedure top 
            WHERE top.erased = FALSE
        `;  
    pool.query(sql, (err, typesProcedures) => {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            if (!typesProcedures.length) {
                res.status(404).send({ message: 'No hay Tipos De Procedimientos !!' });
            } else {
                return res.status(200).send( typesProcedures );
            }
        }
    });
}

function get(req, res) {
    // PENDIENTE FORMATEAR EL OBJETO DE SALIDA
    const idTypeProcedure = req.swagger.params.idTypeProcedure.value;
    const sql = `
        SELECT * 
        FROM mydb.type_of_procedure top 
        WHERE top.erased = FALSE AND top.idtype_of_procedure = ?
    `;
    pool.query(sql, [idTypeProcedure], (err, typeProcedure, ) => {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!typeProcedure.length) {
                res.status(404).send({ message: 'No se encuentra el Tipo de Procedimiento !!' });
            } else {
                console.log({ typeProcedure });
                return res.status(200).send({ typeProcedure });
            }
        }
    });
}

function update(req, res) {
    // No actualizar a los que fueron borrados
    const idTypeProcedure = req.swagger.params.idTypeProcedure.value;
    const { typeOfProcedure } = req.body;
    const newTypeProcedure = {
        description: typeOfProcedure
    };
    const sql = `UPDATE type_of_procedure SET ? WHERE idtype_of_procedure = ?`;
    pool.query(sql, [newTypeProcedure, idTypeProcedure], (err, results) => {
        if (err) {
            console.log(`Err:`, { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            console.log(results);
            if (!results.changedRows) {
                // console.log('changed ' + results.changedRows + ' rows');
                res.status(404).send({ message: 'No se encontro Tipo de procedimiento.' });

            } else {
                console.log('changed ' + results.changedRows + ' rows');
                res.status(200).send({ message: 'Se actualizo el tipo de Procedimiento' });

            }
        }
    });
}

function deleteTypeProcedure(req, res) {
    // despues de eliminar un procedimiento, habria que borrar todos los detalles de procedimientos?
    const idTypeProcedure = req.swagger.params.idTypeProcedure.value;
    const sql = `UPDATE type_of_procedure SET ERASED = TRUE WHERE idtype_of_procedure = ?`;
    pool.query(sql, [idTypeProcedure], (err, results) => {
        if (err) {
            console.log(`Err:`, { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            console.log(results);
            if (!results.changedRows) {
                // console.log('changed ' + results.changedRows + ' rows');
                res.status(404).send({ message: 'No se encontro Tipo de procedimiento.' });

            } else {
                console.log('changed ' + results.changedRows + ' rows');
                const sql = ``;
                res.status(200).send({ message: 'Se elimino el tipo de Procedimiento' });

            }
        }
    });
}
