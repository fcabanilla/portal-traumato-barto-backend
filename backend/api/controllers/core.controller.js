/*********************************/
/*            LOGs               */
/*********************************/
const { createLogger, format, transports } = require('winston');
const { combine} = format;
const moment = require('moment-timezone');
const fs = require('fs');
const configFilePath = getConfigPath();
const config = require(configFilePath);
const configFolder = require('path').dirname(configFilePath);

let _logger;

const addMetadata = format(  (info, opts)=>{
  info.application = "negocio_api";
  info.timestamp = moment().tz("America/Argentina/Cordoba").format();
  return info
});

const logstashFormat = combine(
  //timestamp(),
  addMetadata(),
  format.json()
);  

function getLogger() {
  if (!_logger) {
      _logger = fcreateLogger();
  }
  return _logger;
}

function fcreateLogger() {
  return _logger = createLogger({
    format: logstashFormat,
    transports: [
      new transports.Console(),
      new transports.File({ filename: config.log_file})
    ]
  });
}

function logRequest(req, res, next) {
  getLogger().log({"ip":req.ip, "method":req.method, "url":req.originalUrl, level: "info"});
  next();
}


/*********************************/
/*         middleware            */
/*********************************/
function middleware(middleware) {
  return (req, res) => {
    let i = 0;
    const next = (err) => {
      if (err) {
        return req.notice(err);
      }

      const current = middleware[++i];
      if (current) {
        current(req, res, next);
      }
    };
    middleware[0](req, res, next);
  };
}

/*********************************/
/*        Configuración          */
/*********************************/

//Archivo de configuracion en /run/secrets/ o sino se busca en configDefault.js
function getConfigPath() {
  let path = process.env.CONF || '/run/secrets/backend_api.json';
  let configPath = fileExistsOrDefault(path, '../../config/configDefault');
  return configPath;
}

function fileExistsOrDefault(path, defaultPath) {
  let extensions = ['', '.js', '.json'];
  for (let i = 0; i < extensions.length; i++) {
      if (fs.existsSync(path + extensions[i])) {
          return path + extensions[i];
      }
  }
  return defaultPath;
}



module.exports =  { 
  // Para loguear 
  getLogger,
  logRequest,
  middleware, 
  config,
  configFolder
}
