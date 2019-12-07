const core = require('./core.controller.js')
const ClientSchema = require('../models/client.model')
const Client = ClientSchema.client
const DeviceSchema = require('../models/device.model')
const Device = DeviceSchema.device
const mongoose = require('mongoose');
const Schema = mongoose.Schema

module.exports = {
	clientsControllerGet  : core.middleware([core.logRequest, getAll]),
    clientControllerGetId : core.middleware([core.logRequest, get]),
	topicsControllerGet	  : core.middleware([core.logRequest, topics]),
	getAllTopics
}

function getAll(req, res) {
	Client.find()
	.then(clients => {
		return res.status(200).send(clients);
	})
	.catch(err => {
		return res.status(500).send({
			message: err
		})
	})
}

function get(req, res) {
    let idClient = req.swagger.params.idClient.value
    
    Client.findOne({ _id : idClient })
	.then(client => {
		return res.status(200).send(client);
	})
	.catch(err => {
		return res.status(500).send({
			message: err
		})
	})
}


function topics(req, res) {
	let idClient = req.swagger.params.idClient.value
	console.log(typeof idClient)
	console.log("idCLient", idClient)
	

	Device.find()
	.populate({ path: 'area', populate : { path: 'place', populate: { path: 'client' } }})
	.then( devices => {
		console.log("DEVICES", JSON.stringify(devices))
		
		devices = devices.filter( device => device.area.place.client._id.equals(idClient))

		let topics = devices.map( device => ({
			topicName: device.area.place.client.name + device.area.place.name + '/' + device.area.name + '/' + device.name,
			topicId : device.area.place.client._id + "/" + device.area.place._id + '/' + device.area._id + '/' + device._id
		}))

		return res.status(200).send(topics)
	})
	.catch(err => {
		if(err.reason === undefined)
			return res.status(404).send({ message: 'Not Found' })
		return res.status(500).send({ message: err })
	})
}

function getAllTopics() {
	return new Promise( (resolve, reject) => {
		Device.find()
		.populate({ path: 'area', populate : { path: 'place', populate: { path: 'client' } }})
		.then( devices => {
			let topics = devices.map( device => ({
				topicName: device.area.place.client.name + "/" + device.area.place.name + '/' + device.area.name + '/' + device.name,
				topicId : device.area.place.client._id + "/" + device.area.place._id + '/' + device.area._id + '/' + device._id
			}))
			console.log(topics)
			resolve(topics)
		})
		.catch(err => {
			if(err.reason === undefined)
				reject('Not Found')  
			reject({ message: err })
		})
	})
	
}

