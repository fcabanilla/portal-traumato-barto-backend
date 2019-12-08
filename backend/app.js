"use strict";

var app = require("express")();
var swaggerTools = require("swagger-tools");
var YAML = require("yamljs");
var auth = require("./api/helpers/auth");
var swaggerConfig = YAML.load("./api/swagger/swagger.yaml");
const mongoose = require('mongoose');
const cors = require('cors');
var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'roku',
  password: 'roku',
  database: 'my_db'
});

swaggerTools.initializeMiddleware(swaggerConfig, function (middleware) {
  //Serves the Swagger UI on /docs
  app.use(middleware.swaggerMetadata()); // needs to go BEFORE swaggerSecurity
  app.use(cors());
  app.use(
    middleware.swaggerSecurity({
      //manage token function in the 'auth' module
      Bearer: auth.verifyToken
    })
  );

  var routerConfig = {
    controllers: "./api/controllers",
    useStubs: false
  };

  app.use(middleware.swaggerRouter(routerConfig));

  app.use(middleware.swaggerUi());
  app.set('port', process.env.PORT || 4000);
  // Starting the Server
  app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
  });
/*
  mongoose.connect('mongodb://localhost/iot', { useNewUrlParser: true })
    .then(() => {
      app.listen(3000, () => {
        console.log("OKI")
      })
    })
    .catch(err => {
      console.log('ERROR: connecting to Database. ' + err);
    })
*/
});

