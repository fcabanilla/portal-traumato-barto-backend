const core = require('./core.controller.js')
const pool = require('../../database');



module.exports = {
    patientsControllerPost: core.middleware([core.logRequest, create]),
    patientsControllerGet: core.middleware([core.logRequest, getAll]),
    patientsControllerGetId: core.middleware([core.logRequest, get]),
    patientsControllerDelete: core.middleware([core.logRequest, deleteService]),
    patientsControllerPut: core.middleware([core.logRequest, update]),
}

function create(req, res) {
    const { dni, firstname, lastname, birthdate, sex, notes, email } = req.body;
    const newPerson = {
        idPerson: null,
        dni,
        first_name: firstname,
        last_name: lastname,
        birth_date: birthdate,
        sex
    };
    const newPatient = {
        idPerson: null,
        notes,
        email,
        erased: false
    };
    console.log(newPatient);

    pool.query('INSERT INTO person set ?', [newPerson], function (err, result, fields) {
        if (err) {
            if (err === 'ER_DUP_ENTRY') {
                console.log(`Duplicate entry`);
                res.sendStatus(500);
            }
            console.log('Primer error, no se inserto la persona', err);
            res.sendStatus(500);
        } else {
            pool.query('SELECT idPerson FROM person WHERE dni = ?', [newPerson.dni], function (err, result, fields) {
                if (err) {
                    if (err === 'ER_DUP_ENTRY') {
                        console.log(`Duplicate entry`);
                        res.sendStatus(500);
                    }
                    console.log('Segundo error, no se pudo seleccionar el uuid', err);
                    res.sendStatus(500)
                }
                newPatient.idPerson = result[0].idPerson;
                pool.query('INSERT INTO patient SET ?', [newPatient], function (err, result, fields) {
                    if (err) {
                        console.log('Tercer error, no se pudo hacer insert del paciente');
                        console.log("Err: ", err);
                        res.sendStatus(500);
                    } else {
                        res.sendStatus(200);
                    }
                });
            });
        }
    })
}

function getAll(req, res) {
    // console.log(req.body);
    // const patients = await pool.query('SELECT * FROM patient p INNER JOIN person per ON per.idPerson = p.idPerson');
    const sql = `SELECT * FROM patient p INNER JOIN person per ON per.idPerson = p.idPerson WHERE p.erased = FALSE`;
    pool.query(sql, function (err, patients, fields) {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!patients.length) {
                res.status(404).send({ message: 'No hay Pacientes !!' });
            } else {
                return res.status(200).send( patients );
            }
        }
    });
}

function get(req, res) {
    const idPatient = req.swagger.params.idpatient.value;
    console.log("id Patient: ", { idPatient });
    const sql = `SELECT * FROM patient p INNER JOIN person per ON per.idPerson = p.idPerson WHERE p.idPatient = ? AND p.erased = FALSE`;
    pool.query(sql, [idPatient], function (err, patient, fields) {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!patient.length) {
                res.status(404).send({ message: 'No se encuentra el Paciente !!' });
            } else {
                console.log({ patient });
                return res.status(200).send({ patient });
            }
        }
    });
}

function update(req, res) {
    const idPatient = req.swagger.params.idpatient.value;
    const { dni, firstname, lastname, birthdate, sex, notes, email } = req.body;
    pool.query(`SELECT * FROM patient WHERE erased = FALSE AND idPatient = ?`, [idPatient], function (err, result, fields) {
        if (err) {
            console.log("err:", { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            if (!result.length) {
                res.status(404).send({ message: 'No se encuentra el Paciente !!' });
            } else {
                console.log(result[0].idperson);
                const newPerson = {
                    idPerson: result[0].idperson,
                    dni,
                    first_name: firstname,
                    last_name: lastname,
                    birth_date: birthdate,
                    sex
                };
                console.log(`newPerson: `, newPerson);
                pool.query(`UPDATE person set ? WHERE idPerson = ?`, [newPerson, newPerson.idPerson], function (err, personUpdated, fields) {
                    if (err) {
                        console.log(`Err:`, { err });
                        res.status(500).send({ message: 'Error en la petición.', err });
                    } else {

                        const newPatient = {
                            idPerson: result[0].idperson,
                            notes,
                            email,
                            erased: false
                        };
                        pool.query(`UPDATE patient set ? WHERE idPatient = ?`, [newPatient, idPatient], function (err, patientUpdated, fields) {
                            if (err) {
                                console.log(`Err:`, { err });
                                res.status(500).send({ message: 'Error en la petición.', err });
                            } else {
                                res.status(200).send({ message: 'Se actualizo el Paciente' });
                            }
                        });

                    }
                });
            }
        }
    });
}

function deleteService(req, res) {
    const idPatient = req.swagger.params.idpatient.value;
    pool.query(`SELECT * FROM patient WHERE idPatient = ?`, [idPatient], function (err, result, fields) {
        console.log(result[0].idperson);
        if (err) {
            console.log("err:", { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            if (!result.length) {
                res.status(404).send({ message: 'No se encuentra el Paciente !!' });
            } else {
                const idPerson = result[0].idperson;
                pool.query(`UPDATE patient set erased=true WHERE idPerson = ?`, [idPerson], function (err, patientErased, fields) {
                    if (err) {
                        console.log(`Err:`, { err });
                        res.status(500).send({ message: 'Error en la petición.', err });
                    } else {
                        res.status(200).send({ message: 'El paciente se elimino.'});
                    }
                });
            }
        }
    });
}