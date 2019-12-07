const mongoose = require('mongoose');
const mongooseHistory = require('mongoose-history');
const Schema = mongoose.Schema;


var areaSchema = new Schema({
    name      :   { type: String },
    place     :   { type: Schema.ObjectId, ref: 'place'},
}).index({ name: 1, place: 1}, {unique: true});

areaSchema.plugin(mongooseHistory)

module.exports = { 
    area : mongoose.model('area', areaSchema),
}; 