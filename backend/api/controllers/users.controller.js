const core = require('./core.controller.js')
const UserSchema = require('../models/user.model')
const User = UserSchema.user
const ClientSchema = require('../models/client.model')
const Client = ClientSchema.client
var auth = require("../helpers/auth");
const pool = require('../../database');
const bcrypt = require('bcryptjs');
const uuid = require('../helpers/uuid');
const salt = bcrypt.genSaltSync(10);

module.exports = {
    usersControllerPost: core.middleware([core.logRequest, create]),
    loginPost: core.middleware([core.logRequest, loginPost])
}


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
            , erased
            , role
        FROM mydb.person p  
        INNER JOIN user u on u.idPerson = p.idperson
        WHERE u.username = ?
    `;
    pool.query(sql, [user.username], function(err, result, fields) {
        const userDB = result[0];
        // console.log("Comparacion contrasena", bcrypt.compareSync(user.password, userDB.password));
        if (err) {
            console.log(err);
            if (err = 'ER_NO_SUCH_TABLE') {
                console.log('Error en la consulta SQL, falta una tabla');
                console.log("Detalle del error: " ,err);
            }
        } if (!userDB){
            console.log('El usuario no existe');
            res.send(403);
        }else {
            
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

