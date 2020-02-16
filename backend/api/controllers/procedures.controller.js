const core = require("./core.controller.js");
const pool = require("../../database");
var jwt = require("jsonwebtoken");
var sharedSecret = "shh";
const { query: sql } = require("../models/procedures.model.json");


module.exports = {
    proceduresControllerPost: core.middleware([core.logRequest, create]),
    proceduresControllerGet: core.middleware([core.logRequest, getAll]),
    proceduresControllerGetId: core.middleware([core.logRequest, get]),
    proceduresControllerPut: core.middleware([core.logRequest, update]),
    proceduresControllerDelete: core.middleware([
        core.logRequest,
        deleteProcedure
    ])
};

async function create(req, res) {
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;
    const { idPatient, idInstitution, description, idService} = req.body;
    let token = req.headers.authorization.split(' ')[1];
    token = await jwt.verify(token, sharedSecret);



    const newProcedure = {
        iddetail_type_of_procedure: idDetailTypeProcedure,
        idPatient,
        idInstitution,
        idService,
        idUser: token.iduser,
        description
    };
    console.log(newProcedure);
    // const table_name = 'test_table';
    const table_name = "procedimiento";
    const sql = `
        SELECT iddetail_type_of_procedure AS id 
        FROM detail_type_of_procedure
        WHERE iddetail_type_of_procedure = ?
        UNION
        SELECT idpatient AS id
        FROM patient
        WHERE idpatient = ?
        UNION
        SELECT idinstitution AS id
        FROM institution
        WHERE idinstitution = ?
        UNION
        SELECT idservice AS id
        FROM service
        WHERE idservice = ?
        UNION
        SELECT iduser AS id
        FROM user
        WHERE iduser = ?
    `;
    console.log(newProcedure.iddetail_type_of_procedure,
        newProcedure.idPatient,
        newProcedure.idInstitution,
        newProcedure.idService,
        newProcedure.idUser)
    pool.query(sql, [
        newProcedure.iddetail_type_of_procedure,
        newProcedure.idPatient,
        newProcedure.idInstitution,
        newProcedure.idService,
        newProcedure.idUser
    ])
        .then(
            rows => {
                
                console.log(`Rows`, rows);
                if (rows.length != 5) throw "FOREIGN_KEYS_NOT_EXIST";
                checkResult = rows;
                const sql = `INSERT INTO ${table_name} SET ?`;
                const newProcedure = {
                    iddetail_type_of_procedure: checkResult[0].id,
                    idPatient: checkResult[1].id,
                    idInstitution: checkResult[2].id,
                    idService: checkResult[3].id,
                    idUser: checkResult[4].id,
                    description
                };
                return pool.query(sql, [newProcedure]);
            },
            err => {
                throw err;
            }
        )
        .then(result => {
            if (!result.affectedRows) {
                res
                    .status(404)
                    .send({ message: "El Procedimiento no se ha guardado." });
            } else {
                console.log("Affected " + result.affectedRows + " rows");
                res.status(200).send({ message: "Se creo el Procedimiento" });
            }
        })
        .catch(err => {
            console.log(err);
            if (err === "FOREIGN_KEYS_NOT_EXIST") {
                console.log(`Clave foranea, no existe`);
                res.status(500).send({ message: `Foreign Key doesn't exist` });
            } else {
                res.status(500).send({ message: "Error en la petición" });
            }
        });
}

async function getAll(req, res) {
    // PENDIENTE FORMATEAR EL OBJETO DE SALIDA
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;

    const query = sql.get;

    try {
        results = await pool.query(query[0], idDetailTypeProcedure);
        if (!results.length) {
            res.status(200).send({ message: "No hay Procedimientos !!" });
        } else {
            return res.status(200).send( results );
        }
    } catch (err) {
        if (err.name == 'JsonWebTokenError' && err.message == 'invalid token') {
            res.status(500).send({ message: "Invalid Token" });
        } else {
            res.status(500).send({ message: "Error en la petición.", err });
            
        }
    }
}

async function get(req, res) {
    // PENDIENTE FORMATEAR EL OBJETO DE SALIDA
    const idProcedure = req.swagger.params.idProcedure.value;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;
    const query = sql.getId;
    try {
        results = await pool.query(query[0], [idProcedure, idDetailTypeProcedure]);
        const procedure = results[0];
        if (!results.length) {
            res.status(404).send({ message: "No se encontro el procedimiento." });
        } else {
            return res.status(200).send( procedure );
        }
    } catch (err) {
        res.status(500).send({ message: "Error en la petición.", err });
    }
    
}

async function update(req, res) {
    // No actualizar a los que fueron borrados
    // Corroborar si existe el tipo de procedimiento antes de asignarlo
    const idProcedure = req.swagger.params.idProcedure.value;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;

    const { idPatient, idInstitution, description, idPoll, idService } = req.body;

    const newProcedure = {
        iddetail_type_of_procedure: idDetailTypeProcedure,
        idPatient,
        idInstitution,
        idService,
        idPoll,
        description
    };
    // const table_name = "procedimiento";
    const sql = `UPDATE procedimiento SET ? WHERE idprocedure = ?`;
    try {
        let token = req.headers.authorization.split(' ')[1];
        token = await jwt.verify(token, sharedSecret);

        newProcedure.idUser = token.iduser;
        result = await pool.query(sql, [newProcedure, idProcedure]);
        if (!result.changedRows) {
            res.status(404).send({ message: 'No se encontro el Procedimiento.' });
        } else {
            console.log('changed ' + result.changedRows + ' rows');
            res.status(200).send({ message: 'Se actualizo el Procedimiento' });
        }
    } catch (err) {
        console.log(err);
        res.status(500).send({ message: "Error en la petición.", err });
    }
}

async function deleteProcedure(req, res) {
    // No actualizar a los que fueron borrados
    // Corroborar si existe el tipo de procedimiento antes de asignarlo
    // const idTypeProcedure = req.swagger.params.idTypeProcedure.value;
    const idProcedure = req.swagger.params.idProcedure.value;
    const idDetailTypeProcedure = req.swagger.params.idDetailTypeProcedure.value;

    const sql = `UPDATE procedimiento SET ERASED = TRUE WHERE idprocedure = ? AND iddetail_type_of_procedure = ?`;
    try {
        result = await pool.query(sql, [idProcedure, idDetailTypeProcedure]);
        if (!result.changedRows) {
            res.status(404).send({ message: 'No se encontro el procedimiento.' });
        } else {
            console.log('changed ' + result.changedRows + ' rows');
            res.status(200).send({ message: 'Se elimino el Procedimiento' });
        }
    } catch (err) {
        console.log(err);
        res.status(500).send({ message: "Error en la petición.", err });
    }
}
