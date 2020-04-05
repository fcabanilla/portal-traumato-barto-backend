const core = require('./core.controller.js')
var auth = require("../helpers/auth");
const pool = require('../../database');
const bcrypt = require('bcryptjs');
const salt = bcrypt.genSaltSync(10);
const { query: sql } = require("../models/user.model.json");
const { DUPLICATE_ENTRY, NOT_SAVED, NOT_FOUND, PERSON_NOT_FOUND, ROLE_NOT_FOUND } = require("../models/user.error.model.json");


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
    const query = sql.login;
    const user = {
        username,
        password
    }
    // const sql = `
    //     SELECT *
    //     FROM mydb.person p  
    //     INNER JOIN user u on u.idPerson = p.idperson
    //     WHERE u.username = ? AND u.erased = FALSE
    // `;

    try {
        const roleDB = (await pool.query(query[0], username))[0];
        // if (!roleDB.length) throw ROLE_NOT_FOUND;
        // console.log('Role', roleDB[0].role );
        console.log('Role', roleDB );

        userDB = (await pool.query(query[1], username))[0];
        if(!userDB) throw PERSON_NOT_FOUND;
        console.log({ userDB });

        const tokenPayload = {
            idUser: userDB.iduser,
            username: userDB.username,
            role: roleDB.role
        };
        console.log({ tokenPayload });
        

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
    } catch (err) {
        errorHandler(err, res);
        
    }/*
    pool.query(query, [user.username], (err, result ) => {
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
    });*/

    // console.log("User: ", user);
};

async function create(req, res) {
    const { /*idPerson,*/ idRole, dni, firstname, lastname, birthdate, sex, username, password, email} = req.body;
    const query = sql.post;

    const newPerson = {
        idPerson: null,
        dni,
        first_name: firstname,
        last_name: lastname,
        birth_date: birthdate,
        sex
    };
    let newUser = {
        idPerson: null,
        username,
        password: bcrypt.hashSync(password, salt),
        email,
        erased: false  
    };
    console.log(newUser);


    try {
        const tmpRoleDB = (await pool.query(query[0], idRole))[0];
        if(!tmpRoleDB) console.log("No se encontró ROLE");
        console.log({ tmpRoleDB });
        
        
        newUser.idRole = tmpRoleDB.idrole;
        newUser.role = tmpRoleDB.name;

        console.log("NEW USER*************", newUser);
        

        const personSaved = await pool.query(query[1], newPerson);
        if(!personSaved.affectedRows) console.log("No se guardó la persona");
        console.log({ personSaved });
        

        const tmpPersonDB = await pool.query(query[2], newPerson.dni);
        if(!tmpPersonDB.length) console.log("No se encontró la persona");
        console.log({ tmpPersonDB });
        
        
        newUser.idPerson = tmpPersonDB[0].idPerson;

        const userSaved = await pool.query(query[3], newUser);
        if(!userSaved.affectedRows) console.log("No se guardó el usuario");
        console.log({ userSaved });
        

        
        res.sendStatus(200);

    } catch (err) {
        console.log(err);        
    }
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
                res.status(200).send({ message: 'No hay Usuarios !!' });
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

async function update(req, res) {
    const idUser = req.swagger.params.idUser.value;
    const { dni, firstname, lastname, birthdate, sex, username, password, email, idRole } = req.body;
    const query = sql.post;
    
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

    const sql_1 = `
        SELECT * FROM user 
        WHERE erased = FALSE AND idUser = ?
    `;

    const tmpRoleDB = (await pool.query(query[0], idRole))[0];
    if (!tmpRoleDB) console.log("No se encontró ROLE");
    console.log({ tmpRoleDB });


    newUser.idRole = tmpRoleDB.idrole;
    newUser.role = tmpRoleDB.name;

    console.log("NEW USER*************", newUser);

    pool.query(sql_1, [idUser],  (err, result) => {
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