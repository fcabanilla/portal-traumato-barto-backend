const mongoose = require('mongoose');
const mongooseHistory = require('mongoose-history');
const Schema = mongoose.Schema;


var historySchema = new Schema({
    timeStamp:  { type: Date, default: Date.now   },
	typeOfData: { type: String },
    state:      { type: String },
    idDevice:   { type: String },
})

historySchema.plugin(mongooseHistory)

module.exports = { 
    history : mongoose.model('History', historySchema),
}; 