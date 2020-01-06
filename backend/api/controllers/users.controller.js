const core = require('./core.controller.js')
var auth = require("../helpers/auth");
const pool = require('../../database');
const bcrypt = require('bcryptjs');
const salt = bcrypt.genSaltSync(10);
const { query: sql } = require("../models/user.model.json");
const { DUPLICATE_ENTRY, NOT_SAVED, NOT_FOUND, PERSON_NOT_FOUND } = require("../models/user.error.model.json");


module.exports = {
    loginPost: core.middleware([core.logRequest, loginPost]),
    
    usersControllerPost: core.middleware([core.logRequest, create]),
    usersControllerGet: core.middleware([core.logRequest, getAll]),
    usersControllerGetId: core.middleware([core.logRequest, get]),
    usersControllerPut: core.middleware([core.logRequest, update]),
    usersControllerDelete: core.middleware([core.logRequest, deleteUser])
}


function onlyNotUndefined(tmp) {
    const notUndefinedObj = {};
    Object.keys(tmp).forEach(function (key) {
        if (!(tmp[key] === undefined)) notUndefinedObj[key] = tmp[key];
    });
    return notUndefinedObj;
}

function errorHandler(err, res) {
    if (err.status != undefined) {
        console.log(err.description);
        res.status(err.code).send({ message: err.description });
    } else {
        console.log(err);
        res.status(500).send({ message: "Error en la petición.", err });
    }
}

async function loginPost(req, res, next) {
    const { username, password } = req.body;
    const user = {
        username,
        password,
        role: "ADMIN"
    }
    const sql = `
        SELECT
              dni
            , first_name
            , last_name
            , username
            , password
            , email
            , sex
            , alternative_email
            , role
        FROM mydb.person p  
        INNER JOIN user u on u.idPerson = p.idperson
        WHERE u.username = ? AND u.erased = FALSE
    `;
    pool.query(sql, [user.username], (err, result ) => {
        console.log('****** result', result);
        
        
        // console.log("Comparacion contrasena", bcrypt.compareSync(user.password, userDB.password));
        if (err) {
            console.log(err);
            if (err = 'ER_NO_SUCH_TABLE') {
                console.log('Error en la consulta SQL, falta una tabla');
                console.log("Detalle del error: ", err);
            }
        } 
        const userDB = result[0];
        if (!userDB) {
            console.log('El usuario no existe');
            res.send(403);
        } else {

            

            if (bcrypt.compareSync(user.password, userDB.password)) {
                const tokenString = auth.issueToken(username, user.role);
                const response = { token: tokenString };
                console.log({ token: tokenString });
                res.writeHead(200, { "Content-Type": "application/json" });
                return res.end(JSON.stringify(response));
            } else {
                const response = { message: "Error: Credentials incorrect" };
                res.writeHead(403, { "Content-Type": "application/json" });
                return res.end(JSON.stringify(response));
            }
        }
        // console.log({fields :fields});
    });

    // console.log("User: ", user);



};

function create(req, res) {
    const { /*idPerson,*/ dni, firstname, lastname, birthdate, sex, username, password, email} = req.body;
    const newPerson = {
        idPerson: null,
        dni,
        first_name: firstname,
        last_name: lastname,
        birth_date: birthdate,
        sex
    };
    const newUser = {
        idPerson: null,
        username,
        password: bcrypt.hashSync(password, salt),
        email,
        erased: false  
    };
    console.log(newUser);  
    
    pool.query('INSERT INTO person set ?', [newPerson], function(err, result, fields) {
        if (err) {
            if (err === 'ER_DUP_ENTRY') {
                console.log(`Duplicate entry`);
                res.sendStatus(500);
            }
            console.log('Primer error, no se inserto la persona', err);
            res.sendStatus(500);
        } else {
            pool.query('SELECT idPerson FROM person WHERE dni = ?', [newPerson.dni], function (err, result, fields){
                if (err){
                    if (err === 'ER_DUP_ENTRY') {
                        console.log(`Duplicate entry`);
                        res.sendStatus(500);
                    }
                    console.log('Segundo error, no se pudo seleccionar el uuid', err);
                    res.sendStatus(500)
                }
                newUser.idPerson = result[0].idPerson;
                pool.query('INSERT INTO user SET ?', [newUser], function (err, result, fields) {
                    if (err) {
                        console.log('Tercer error, no se pudo hacer insert del usuario');
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
    const sql = `
        SELECT * FROM user u 
        INNER JOIN person per ON per.idPerson = u.idPerson 
        WHERE u.erased = FALSE
    `;
    pool.query(sql, (err, users) => {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!users.length) {
                res.status(404).send({ message: 'No hay Usuarios !!' });
            } else {
                return res.status(200).send( users );
            }
        }
    });
}

function get(req, res) {
    const idUser = req.swagger.params.idUser.value;
    const sql = `
        SELECT * FROM user u
        INNER JOIN person per ON per.idPerson = u.idPerson 
        WHERE u.idUser = ? AND u.erased = FALSE
    `;
    pool.query(sql, [idUser], (err, user) => {
        if (err) {
            res.status(500).send({ message: 'Error en la petición.' });
        } else {
            if (!user.length) {
                res.status(404).send({ message: 'No se encuentra el Usuario !!' });
            } else {
                console.log({ user });
                return res.status(200).send({ user });
            }
        }
    });
}

function update(req, res) {
    const idUser = req.swagger.params.idUser.value;
    const { dni, firstname, lastname, birthdate, sex, username, password, email } = req.body;
    
    const tmpPerson = {
        dni,
        first_name: firstname,
        last_name: lastname,
        birth_date: birthdate,
        sex
    };
    const tmpUser = {
        username,
        email,
        erased: false
    };
    if (!(password === undefined)) tmpUser.password = bcrypt.hashSync(password, salt);

    const newPerson = onlyNotUndefined(tmpPerson);
    const newUser = onlyNotUndefined(tmpUser);

    console.log("newPerson", newPerson);
    console.log("newUser", newUser);

    const sql = `
        SELECT * FROM user 
        WHERE erased = FALSE AND idUser = ?
    `;
    pool.query(sql, [idUser],  (err, result) => {
        if (err) {
            console.log("err:", { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            if (!result.length) {
                res.status(404).send({ message: 'No se encuentra el Usuario !!' });
            } else {
                console.log(`result[0]`, result[0]);
                newPerson.idPerson = result[0].idperson;
                console.log(newPerson);
                const sql = `UPDATE person set ? WHERE idPerson = ?`;
                
                pool.query(sql, [newPerson, newPerson.idPerson], (err) => {
                    if (err) {
                        console.log(`Err:`, { err });
                        res.status(500).send({ message: 'Error en la petición.', err });
                    } else {
                        const sql = `UPDATE user set ? WHERE idUser = ?`;

                        pool.query(sql, [newUser, idUser], (err) => {
                            if (err) {
                                console.log(`Err:`, { err });
                                res.status(500).send({ message: 'Error en la petición.', err });
                            } else {
                                res.status(200).send({ message: 'Se actualizo el Usuario' });
                            }
                        });

                    }
                });
            }
        }
    });
}

async function deleteUser(req, res) {
    const idUser = req.swagger.params.idUser.value;
    const query = sql.delete;
    
    try {
        const userDB = await pool.query(query[0], idUser);
        console.log('userDB', userDB);
        if (!userDB.length) throw NOT_FOUND;

        const idPerson = userDB[0].idperson;
        const personErased = await pool.query(query[1], idPerson);
        if (!personErased.changedRows) throw PERSON_NOT_FOUND;

        const userErased = await pool.query(query[2], idUser)
        if (!userErased.changedRows) throw NOT_FOUND;

        return res.status(200).send({ message: 'Se eliminó el Usuario' });

    } catch (err) {
        errorHandler(err, res);
    }


    
    /*
    const sql = `
        SELECT * FROM user 
        WHERE idUser = ? AND erased = FALSE
    `;
    pool.query(sql, [idUser], (err, result) => {
        if (err) {
            console.log("err:", { err });
            res.status(500).send({ message: 'Error en la petición.', err });
        } else {
            if (!result.length) {
                res.status(404).send({ message: 'No se encuentra el Usuario !!' });
            } else {
                const idPerson = result[0].idperson;
                const sql = `UPDATE user set erased = TRUE WHERE idPerson = ?`;

                pool.query(sql, [idPerson], (err) => {
                    if (err) {
                        console.log(`Err:`, { err });
                        res.status(500).send({ message: 'Error en la petición.', err });
                    } else {
                        res.status(200).send({ message: 'El Usuario se elimino.' });
                    }
                });
            }
        }
    });
    */

}