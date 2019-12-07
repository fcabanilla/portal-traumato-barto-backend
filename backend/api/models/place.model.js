const mongoose = require('mongoose');
const mongooseHistory = require('mongoose-history');
const Schema = mongoose.Schema;


var placeSchema = new Schema({
    name       :   { type: String },
    client     :   { type: Schema.ObjectId, ref: 'client'},
}).index({ name: 1, client: 1}, {unique: true});

placeSchema.plugin(mongooseHistory);

module.exports = { 
    place : mongoose.model('place', placeSchema),
}; 