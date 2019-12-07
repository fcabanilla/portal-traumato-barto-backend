const mongoose = require('mongoose');
const mongooseHistory = require('mongoose-history');
const Schema = mongoose.Schema;


var deviceSchema = new Schema({
    name        :   { type: String },
    state       :   { type: String },
    typeOfData  :   { type: String },
    area        :   { type: Schema.ObjectId, ref: 'area'},
}).index({ name: 1, area: 1}, {unique: true});

deviceSchema.plugin(mongooseHistory)

module.exports = { 
    device : mongoose.model('device', deviceSchema),
}; 