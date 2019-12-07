const mongoose = require('mongoose');
const mongooseHistory = require('mongoose-history');
const Schema = mongoose.Schema;


var userSchema = new Schema({
    username    :   { type: String, index: {unique: true}},
    password    :   { type: String },
    role        :   { type: String },
})

userSchema.plugin(mongooseHistory)

module.exports = { 
    user : mongoose.model('user', userSchema),
}; 