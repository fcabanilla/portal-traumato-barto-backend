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
function formatOutput(tmp) {
    const { iduser: idUser, username, email, alternativeEmail, dni, first_name: firstName, last_name: lastName, birth_date: birthdate, sex } = tmp;
    const formated = {
        idUser,
        username,
        email,
        alternativeEmail,
        dni,
        firstName,
        lastName,
        birthdate,
        sex
    };
    return formated;
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
        role: "fede"
    }
    const sql = `
        SELECT *
        FROM person p  
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
            const tokenPayload = {
                iduser: userDB.iduser,
                username: userDB.username,
                role: user.role                
            };
            const str = ''
            tokenPayload.fullname = str.concat(userDB.first_name, userDB.first_name);
            
            

            if (bcrypt.compareSync(user.password, userDB.password)) {
                const tokenString = auth.issueToken(tokenPayload);
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
            console.log('Primer error, no se insertó la persona', err);
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

async function getAll(req, res) {
    const query = sql.get;
    const usersDB = [];

    try {
        const tmpUsersDB = await pool.query(query[0]);        
        if(!tmpUsersDB.length) throw NOT_FOUND;
        for (const userDB of tmpUsersDB) {
            usersDB.push(formatOutput(userDB));
        }

        return res.status(200).send( usersDB );
    } catch (err) {
        errorHandler(err, res);
    }
}

async function get(req, res) {
    const idUser = req.swagger.params.idUser.value;
    const query = sql.getId;

    try {
        const tmpUserDB = await pool.query(query[0], [idUser]);
        if (!tmpUserDB.length ) throw NOT_FOUND;
        return res.status(200).send(formatOutput(tmpUserDB[0]) );
    } catch (err) {
        errorHandler(err, res);
    }
}

async function update(req, res) {
    const idUser = req.swagger.params.idUser.value;
    const { dni, firstname: firstName, lastname: lastName, birthdate, sex, username, password, email } = req.body;
    const query = sql.put;

    const tmpPerson = {
        dni,
        first_name: firstName,
        last_name: lastName,
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
    console.log("newPerson", newPerson);
    
    const newUser = onlyNotUndefined(tmpUser);
    console.log("newUser", newUser);

    try {
        const usersDB = await pool.query(query[0], idUser);
        if(!usersDB.length) throw NOT_FOUND;        
        newPerson.idPerson = usersDB[0].idPerson;

        personUpdated = await pool.query(query[1], [newPerson, newPerson.idPerson]);
        if (!personUpdated.changedRows) throw NOT_SAVED;
        
        userUpdated = await pool.query(query[2], [newUser, idUser]);
        if (!userUpdated.changedRows) throw NOT_SAVED;
        
        res.status(200).send({ message: 'Se actualizó el Usuario' });

    } catch (err) {
        errorHandler(err, res);
    }

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

}