const core = require('./core.controller.js')
const PlaceSchema = require('../models/place.model')
const Place = PlaceSchema.place


module.exports = {
	placesControllerGet 	: core.middleware([core.logRequest, getAll]),
	placeControllerPost 	: core.middleware([core.logRequest, create]),
	placeControllerGetId	: core.middleware([core.logRequest, get]),
	placeControllerPutId	: core.middleware([core.logRequest, update]),
	placeControllerDelete	: core.middleware([core.logRequest, deletePlace]),
}


function getAll(req, res) {
    let idClient = req.swagger.params.idClient.value
    console.log("getPlaces", idClient)
	
	Place.find()
	.populate({ path: 'client', match: { _id : idClient }})
	.then(places => {
		return res.status(200).send(places);
	})
	.catch(err => {
		if(err.reason === undefined)
			return res.status(404).send({ message: 'Not Found' })
		return res.status(500).send({ message: err })
	})
}

function create(req, res) {
	let idClient = req.swagger.params.idClient.value
	
	let place = new Place(req.body)
	place.client = idClient
	
	Place.find()
	.populate({ path: 'client', match: { _id : idClient }})
	.then(() => {
	
		return place.save()
	})
	.then( place => {
		res.status(201).jsonp(place);
	})
	.catch(err => {
		if(err.reason === undefined)
			return res.status(404).send({ message: 'Not Found' })
		else
			return res.status(500).send({ message: err })
	})	
}

function get(req, res) {
    let idClient = req.swagger.params.idClient.value
	let idPlace = req.swagger.params.idPlace.value
    
	Place.findById( idPlace)
	.populate({ path: 'client', match: { _id : idClient }})
	.then(places => {
		return res.status(200).send(places);
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

	let place = req.body

	Place.find()
	.populate({ path: 'client', match: { _id : idClient }})
	.then(() => {
	
		return Place.findByIdAndUpdate(idPlace, place)
	})
	.then( place => {
		res.status(204).jsonp(place);
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

	Place.find()
	.populate({ path: 'client', match: { _id : idClient }})
	.then(() => {
	
		return Place.findByIdAndDelete(idPlace)
	})
	.then( place => {
		return res.status(200).send();
	})
	.catch(err => {
		if(err.reason === undefined)
			return res.status(404).send({ message: 'Not Found' })
		else
			return res.status(500).send({ message: err })
	})	
}