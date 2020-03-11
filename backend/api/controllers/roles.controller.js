const core = require("./core.controller.js");
const pool = require("../../database");
const { query: sql } = require("../models/role.model.json");
const { DUPLICATE_ROLE, DUPLICATE_ENTRY, NOT_SAVED, NOT_FOUND, NOT_FOUND_GET_ALL } = require("../models/role.error.model.json");

module.exports = {
    rolesControllerPost:    core.middleware([core.logRequest, create]),
    rolesControllerGet:     core.middleware([core.logRequest, getAll]),
    rolesControllerGetId:   core.middleware([core.logRequest, get]),
    rolesControllerPut:     core.middleware([core.logRequest, update]),
    rolesControllerDelete:  core.middleware([core.logRequest, deleteRole])
};
function onlyNotUndefined(tmp) {
    const notUndefinedObj = {};
    Object.keys(tmp).forEach(function (key) {
        if (!(tmp[key] === undefined)) notUndefinedObj[key] = tmp[key];
    });
    return notUndefinedObj;
}
function errorHandler(err, res) {
    console.log("Error ", err);
    console.log("RES ", res);
    
    if (err.status != undefined) {
        console.log(err.description);
        res.status(err.code).send({ message: err.description });
    } else {
        console.log(err);
        res.status(500).send({ message: "Error en la petición.", err });
    }
}

async function create(req, res) {    
    const query = sql.post;
    const { role, roleDescription, idPermissions = 0, specialPermission = null } = req.body;
    let newRole = {
        idpermissions: idPermissions,
        name: role,
        description: roleDescription,
        special_permission: specialPermission
    };
    newRole = onlyNotUndefined(newRole);
    try {
        console.log({newRole});
        
        const existRoleDB = await pool.query(query[0], newRole.name);
        if(existRoleDB.length) {console.log("duplicado"); /*throw DUPLICATE_ROLE*/};
        
        const roleSaved = await pool.query(query[1], newRole);

        console.log("ROLEsAVED*************************************************", roleSaved);
        if (!roleSaved.affectedRows) throw NOT_SAVED;
        res.status(201).send({ message: "Se creo el rol" });
        
    } catch (err) {
        console.log(err);

        errorHandler(err, res);
    }
}
async function getAll(req, res) {
    const query = sql.get;
    try {
        const tmpRolesDB = await pool.query(query[0]);
        console.log('*********', tmpRolesDB);
        
        if(!tmpRolesDB.length) throw NOT_FOUND_GET_ALL;
        
        return res.status(200).send(tmpRolesDB);

    } catch (err) {
        errorHandler(err, res);
    }
}
async function get(req, res) {
    const query = sql.getId;
    const idRole = req.swagger.params.idRole.value;

    try {
        const tmpRoleDB = await pool.query(query[0], idRole);
        console.log('*********', tmpRoleDB);

        if (!tmpRoleDB.length) throw NOT_FOUND;

        return res.status(200).send(tmpRoleDB);

    } catch (err) {
        errorHandler(err, res);
    }
}
async function update(req, res) {
    const query = sql.put;
    try {
        
    } catch (err) {
        errorHandler(err, res);
    }
}
async function deleteRole(req, res) {
    const query = sql.delete;
    try {
        
    } catch (err) {
        errorHandler(err, res);
    }
}