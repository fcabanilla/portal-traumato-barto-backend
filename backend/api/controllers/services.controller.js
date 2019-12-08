const core = require('./core.controller.js')

module.exports = {
    servicesControllerPost: core.middleware([core.logRequest, create]),
}

function create(req, res) {
    
    console.log(req.body);
    /*
    
    
    let idClient = req.swagger.params.idClient.value
    let idPlace = req.swagger.params.idPlace.value

    let area = new Area(req.body)
    area.place = idPlace

    Area.find()
        .populate({ path: 'place', match: { _id: idPlace } })
        .populate({ path: 'client', match: { _id: idClient } })
        .then(() => {
            return area.save()
        })
        .then(area => {
            res.status(201).jsonp(area);
        })
        .catch(err => {
            if (err.reason === undefined)
                return res.status(404).send({ message: 'Not Found' })
            else
                return res.status(500).send({ message: err })
        })
    */
}