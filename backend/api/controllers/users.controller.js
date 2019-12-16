const core = require('./core.controller.js')
const UserSchema = require('../models/user.model')
const User = UserSchema.user
const ClientSchema = require('../models/client.model')
const Client = ClientSchema.client
var auth = require("../helpers/auth");
const pool = require('../../database');
const uuid = require('../helpers/uuid');


module.exports = {
    usersControllerPost: core.middleware([core.logRequest, create]),
    loginPost: core.middleware([core.logRequest, loginPost])
}


function create(req, res) {
    // console.log(req.body);
    const { /*idPerson,*/ dni, firstname, lastname, birthdate, sex, username, password, roles , email} = req.body;
    // const idPerson = uuid();    
    // console.log({idPerson: idPerson});
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
        password,
        email,
        erased: false  
    };
    // console.log({newPerson: newPerson});
    // console.log({newUser: newUser});
    // console.log({roles:roles});
    
    
    
    pool.query('INSERT INTO person set ?', [newPerson], function(err, result, fields) {
        if (err) {
            console.log('Primer error, no se inserto la persona', err);
        } else {
            pool.query('SELECT idPerson FROM person WHERE dni = ?', [newPerson.dni], function (err, result, fields){
                if (err)
                console.log('Segundo error, no se pudo seleccionar el uuid', err);
                // console.log("Result: ", result);
                newUser.idPerson = result[0].idPerson;
                // console.log(result[0].idPerson);
                pool.query('INSERT INTO user SET ?', [newUser], function (err, result, fields) {
                    if (err) {
                        // console.log({newPerson: newPerson});
                        // console.log({newUser: newUser});
                        console.log('Tercer error, no se pudo hacer insert del usuario');
                    } else {
                        res.sendStatus(200)
                    }                    
                });
            });
        }
    })    
}

async function loginPost(req, res, next) {
    console.log("asdasd");
    let username = req.body.username;
    let password = req.body.password;
    // var role = req.swagger.params.role.value;
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
        FROM mydb.person p  
        INNER JOIN user u on u.idPerson = p.idperson
        WHERE u.username = ?
    `;
    const sqlRole = `
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
                , r.description AS role
            FROM mydb.person p  
            INNER JOIN user u on u.idPerson = p.idperson
            INNER JOIN user_role ur on ur.iduser = u.iduser
            INNER JOIN role r on ur.iduser_role = r.iduser_role
            WHERE u.username = ?
    `;
    pool.query(sql, [username], function(err, result, fields) {
        if (err) {
            console.log("Fallo la query de busqueda de usuario" ,err);
        } else {
            const user = result[0];
            pool.query(sqlRole, [user.username], function (err, result2, fields){
                if (err) {
                    console.log("Fallo la query de roles", err);
                } else {
                    console.log("lalalala", result2);
                    user.role = result2[0].role
                    if (username == user.username && password == user.password) {
                        console.log("User:", user);
                        const tokenString = auth.issueToken(username, user.role);
                        const response = { token: tokenString };
                        res.writeHead(200, { "Content-Type": "application/json" });
                        return res.end(JSON.stringify(response));
                    } else {
                        const response = { message: "Error: Credentials incorrect" };
                        res.writeHead(403, { "Content-Type": "application/json" });
                        return res.end(JSON.stringify(response));
                    }
                } 
            });
        }
        // console.log({fields :fields});
    });

    // console.log("User: ", user);

    

};

