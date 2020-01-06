const core = require("./core.controller.js");
const pool = require("../../database");

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

function create(req, res) {
    const { idDetailTypeProcedure, idPatient, idInstitution, description, idUser, idService} = req.body;

    const newProcedure = {
        iddetail_type_of_procedure: idDetailTypeProcedure,
        idPatient,
        idInstitution,
        idService,
        idUser,
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
    const sql = `
        SELECT DISTINCT
        p.idprocedure AS "procedureID"
        , p.description AS "procedureDescription"
        , p.date AS "procedureDate"
        , i.name AS "institutionName"
        , i.display_name AS "institutionDisplayName"
        , i.country AS "institutionCountry"
        , i.state AS "institutionState"
        , i.city AS "institutionCity"
        , i.direction AS "institutionDirection"
        , i.type_of_establishment AS "institutionTypeOfEstablishment"
        , i.description AS "institutionDescription"
        , s.service_name AS "serviceName"
        , s.description AS "serviceDescription"
        , s.service_code AS "serviceCode"
        , s.owner AS "serviceOwner"
        , per.dni AS "patientDNI"
        , per.first_name AS "patientFirstname"
        , per.last_name AS "patientLastname"
        , per.birth_date AS "patientBirthdate"
        , per.sex AS "patientSex"
        , pa.email AS "patientEmail"
        , pa.notes AS "patientNotes"
        , top.description AS "typeOfProcedureDescription"
        , dtop.description AS "detailTypeOfProcedureDescription"
        , dtop.detail AS "detailTypeOfProcedureDetail"
        FROM procedimiento p
        INNER JOIN institution i ON i.idinstitution = p.idinstitution
        INNER JOIN service s ON s.idservice = p.idservice
        INNER JOIN patient pa ON pa.idpatient = p.idpatient
        INNER JOIN person per ON per.idperson = pa.idperson
        INNER JOIN detail_type_of_procedure dtop ON dtop.iddetail_type_of_procedure = p.iddetail_type_of_procedure
        INNER JOIN type_of_procedure top ON top.idtype_of_procedure = dtop.idtype_of_procedure
        WHERE pa.erased = FALSE 
            AND top.erased = FALSE 
            AND dtop.erased = FALSE 
            AND i.erased = FALSE
            AND s.erased = FALSE
            AND p.erased = FALSE
    `;

    try {
        results = await pool.query(sql);
        if (!results.length) {
            res.status(404).send({ message: "No hay Procedimientos !!" });
        } else {
            return res.status(200).send( results );
        }
    } catch (err) {
        res.status(500).send({ message: "Error en la petición.", err });
    }
}

async function get(req, res) {
    // PENDIENTE FORMATEAR EL OBJETO DE SALIDA
    const idProcedure = req.swagger.params.idProcedure.value;
    const sql = `
        SELECT DISTINCT
        p.idprocedure AS "procedureID"
        , p.description AS "procedureDescription"
        , p.date AS "procedureDate"
        , i.name AS "institutionName"
        , i.display_name AS "institutionDisplayName"
        , i.country AS "institutionCountry"
        , i.state AS "institutionState"
        , i.city AS "institutionCity"
        , i.direction AS "institutionDirection"
        , i.type_of_establishment AS "institutionTypeOfEstablishment"
        , i.description AS "institutionDescription"
        , s.service_name AS "serviceName"
        , s.description AS "serviceDescription"
        , s.service_code AS "serviceCode"
        , s.owner AS "serviceOwner"
        , per.dni AS "patientDNI"
        , per.first_name AS "patientFirstname"
        , per.last_name AS "patientLastname"
        , per.birth_date AS "patientBirthdate"
        , per.sex AS "patientSex"
        , pa.email AS "patientEmail"
        , pa.notes AS "patientNotes"
        , top.description AS "typeOfProcedureDescription"
        , dtop.description AS "detailTypeOfProcedureDescription"
        , dtop.detail AS "detailTypeOfProcedureDetail"
        FROM procedimiento p
        INNER JOIN institution i ON i.idinstitution = p.idinstitution
        INNER JOIN service s ON s.idservice = p.idservice
        INNER JOIN patient pa ON pa.idpatient = p.idpatient
        INNER JOIN person per ON per.idperson = pa.idperson
        INNER JOIN detail_type_of_procedure dtop ON dtop.iddetail_type_of_procedure = p.iddetail_type_of_procedure
        INNER JOIN type_of_procedure top ON top.idtype_of_procedure = dtop.idtype_of_procedure
        WHERE pa.erased = FALSE 
            AND top.erased = FALSE 
            AND dtop.erased = FALSE 
            AND i.erased = FALSE
            AND s.erased = FALSE
            AND p.erased = FALSE
            AND p.idprocedure = ?
    `;
    try {
        results = await pool.query(sql, idProcedure);
        const procedure = results[0];
        if (!results.length) {
            res.status(404).send({ message: "No se encontro el procedimiento." });
        } else {
            return res.status(200).send({ procedure });
        }
    } catch (err) {
        res.status(500).send({ message: "Error en la petición.", err });
    }
    
}

async function update(req, res) {
    // No actualizar a los que fueron borrados
    // Corroborar si existe el tipo de procedimiento antes de asignarlo
    // const idTypeProcedure = req.swagger.params.idTypeProcedure.value;
    const idProcedure = req.swagger.params.idProcedure.value;
    const { idDetailTypeProcedure, idPatient, idInstitution, description, idPoll, idUser, idService } = req.body;

    const newProcedure = {
        iddetail_type_of_procedure: idDetailTypeProcedure,
        idPatient,
        idInstitution,
        idService,
        idUser,
        idPoll,
        description
    };
    // const table_name = "procedimiento";
    const sql = `UPDATE procedimiento SET ? WHERE idprocedure = ?`;
    try {
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
    const sql = `UPDATE procedimiento SET ERASED = TRUE WHERE idprocedure = ?`;
    try {
        result = await pool.query(sql, [idProcedure]);
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
