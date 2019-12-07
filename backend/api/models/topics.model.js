const mongoose = require('mongoose');
const mongooseHistory = require('mongoose-history');
const Schema = mongoose.Schema;


var topicsSchema = new Schema({
    idClient:   { type: String, index: {unique: true} },
    places  :   
        [
            {
                idPlace :   { type: String, index: {unique: true} },
                name    :   { type: String },
                areas   :   
                    [
                        {
                            idArea  :   { type: String, index: {unique: true} },
                            name    :   { type: String },
                            devices :   
                                [
                                    {
                                        idDevice    :   { type: String, index: {unique: true} },
                                        name        :   { type: String },
                                        state       :   { type: String },
                                        typeOfData  :   { type: String }
                                    }
                                ]
                        }
                    ]
            }    
        ]
})

topicsSchema.plugin(mongooseHistory)

module.exports = { 
    topics: mongoose.model('topics', topicsSchema),
}; 