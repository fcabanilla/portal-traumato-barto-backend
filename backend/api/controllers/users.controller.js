const core = require('./core.controller.js')
const UserSchema = require('../models/user.model')
const User = UserSchema.user
const ClientSchema = require('../models/client.model')
const Client = ClientSchema.client
var auth = require("../helpers/auth");


module.exports = {
    usersControllerPost : core.middleware([core.logRequest, create]),
    loginPost           : core.middleware([core.logRequest, loginPost])
}


function create(req, res) {
	console.log(req.body);
    /*
    let user =  new User(req.body);
    console.log('user: ', user);
	user.save()
	.then( user => {
    
        let client = new Client({user: user})

        return client.save()
    })
    .then( () => {
        console.log('client: ', client);
        return res.status(201).send()
    })
	.catch( err => {
        if(err.code == 11000)
            return res.status(409).send('Username existente')
        else
            return res.status(500).send('Error' + err)
    })
    */
}

function loginPost(req, res, next) {
    let username = req.body.username;
    let password = req.body.password;
    let user = {}
    User.findOne({ 'username': username , 'password': password })
    .then (userDB => {
        user = userDB
        console.log('user', user)
        if (user == null){
            err.code = 403
            err.message = "Incorrect Credentials"
            throw err
        }
        else {
            console.log('else')
            return Client.findOne({ "user" : user._id})
        }  
    })
    .then( client => {
        let tokenString = auth.issueToken(user.username, user.role);
        let response = { token: tokenString, client: client._id };
        res.writeHead(200, { "Content-Type": "application/json" });
        return res.end(JSON.stringify(response));
    })
    .catch( err => {
        console.log(err)
        return res.status(err.code).send(err.message)
    })
   
  };
  
