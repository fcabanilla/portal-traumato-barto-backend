const core = require('./core.controller.js')
const AreaSchema = require('../models/area.model')
const Area = AreaSchema.area


module.exports = {
	areasControllerGet 		: core.middleware([core.logRequest, getAll]),
	areaControllerPost 		: core.middleware([core.logRequest, create]),
	areaControllerGetId		: core.middleware([core.logRequest, get]),
	areaControllerPutId		: core.middleware([core.logRequest, update]),
	areaControllerDelete	: core.middleware([core.logRequest, deletePlace]),
}


function getAll(req, res) {
	let idClient = req.swagger.params.idClient.value
	let idPlace = req.swagger.params.idPlace.value
    
	Area.find()
	.populate({ path: 'place', match: { _id : idPlace }})
	.populate({ path: 'client', match: { _id : idClient }})
	.then(areas => {
		return res.status(200).send(areas);
	})
	.catch(err => {
		if(err.reason === undefined)
			return res.status(404).send({ message: 'Not Found' })
		return res.status(500).send({ message: err })
	})
}

function create(req, res) {
	let idClient = req.swagger.params.idClient.value
	let idPlace = req.swagger.params.idPlace.value
	
	let area = new Area(req.body)
	area.place = idPlace
	
	Area.find()
	.populate({ path: 'place', match: { _id : idPlace }})
	.populate({ path: 'client', match: { _id : idClient }})
	.then(() => {
		return area.save()
	})
	.then( area => {
		res.status(201).jsonp(area);
	})
	.catch( err => {
		if(err.reason === undefined)
			return res.status(404).send({ message: 'Not Found' })
		else
			return res.status(500).send({ message: err })
	})
}

function get(req, res) {
    let idClient = req.swagger.params.idClient.value
	let idPlace = req.swagger.params.idPlace.value
	let idArea = req.swagger.params.idArea.value
	
	Area.findById( idArea)
	.populate({ path: 'place', match: { _id : idPlace }})
	.populate({ path: 'client', match: { _id : idClient }})
	.then(areas => {
		return res.status(200).send(areas);
	})
	.catch(err => {
		if(err.reason === undefined)
			return res.status(404).send({ message: 'Not Found' })
		else
			return res.status(500).send({ message: err })
	})
}

function update(req, res) {
	let idClient = req.swagger.params.idClient.value
	let idPlace = req.swagger.params.idPlace.value
	let idArea = req.swagger.params.idArea.value

	let area = req.body

	Area.find()
	.populate({ path: 'place', match: { _id : idPlace }})
	.populate({ path: 'client', match: { _id : idClient }})
	.then(() => {
		return Area.findByIdAndUpdate(idArea, area)
	})
	.then( area => {
		return res.status(204).send(area);
	})
	.catch(err => {
		if(err.reason === undefined)
			return res.status(404).send({ message: 'Not Found' })
		else
			return res.status(500).send({ message: err })
	})
}

function deletePlace(req, res) {
	let idClient = req.swagger.params.idClient.value
	let idPlace = req.swagger.params.idPlace.value
	let idArea = req.swagger.params.idArea.value

	Area.find()
	.populate({ path: 'place', match: { _id : idPlace }})
	.populate({ path: 'client', match: { _id : idClient }})
	.then(() => {
		return Area.findByIdAndDelete(idArea)
	})
	.then(() => {
		return res.status(200).send();
	})
	.catch(err => {
		return res.status(500).send({
			message: err
		})
	})
}