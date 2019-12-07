const mongoose = require('mongoose');
const mongooseHistory = require('mongoose-history');
const Schema = mongoose.Schema;


var clientSchema = new Schema({
    user    :   { type: Schema.ObjectId, ref: 'user'},
    name    :   { type: String }
})

clientSchema.plugin(mongooseHistory)

module.exports = { 
    client : mongoose.model('client', clientSchema),
}; 