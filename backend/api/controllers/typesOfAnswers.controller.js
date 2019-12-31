const core = require("./core.controller.js");
const pool = require("../../database");
const { query:sql } = require("../models/typesOfAnswers.model.json");

module.exports = {
    typesOfAnswersControllerPost: core.middleware([core.logRequest, create]),
    typesOfAnswersControllerGet: core.middleware([core.logRequest, getAll]),
    typesOfAnswersControllerGetId: core.middleware([core.logRequest, get]),
    typesOfAnswersControllerPut: core.middleware([core.logRequest, update]),
    typesOfAnswersControllerDelete: core.middleware([core.logRequest,deleteTypeOfAnswer])
};


function formatTypeOfAnswer(rows) {
    // const { idtype_of_answer: idTypeOfAnswer, type_of_answer: typeOfAnswer, description, addable } = rows;
    const typeOfAnswer = {};
    const answers = [];
    const sampleValues = [];

    for (const row of rows) {
        let answer = {};
        answer.answer = row.answer;
        answer.score = row.score;
        sampleValues.push(answer.answer);
        answers.push(answer);
    }
    // console.log("eeeeeeee",rows);
    typeOfAnswer.idTypeOfAnswer = rows[0].idtype_of_answer;
    typeOfAnswer.typeOfAnswer = rows[0].type_of_answer;
    typeOfAnswer.description = rows[0].description;
    typeOfAnswer.addable = rows[0].addable == true;
    typeOfAnswer.answers = answers;
    typeOfAnswer.sampleValues = sampleValues.join(', ');
    return typeOfAnswer;
}

async function setAnswersErased(answersIDs, state = true) {
    const query = sql.delete[1];    
    try {
        for (const row of answersIDs) {
            const idAnswersDB = row.idanswer;
            const result = await pool.query(query, [state, idAnswersDB]);
            if (!result.changedRows) {
                throw "ANSWER_NOT_FOUND";
                // res.status(404).send({ message: 'No se encontro la Respuesta' });
            }
            console.log('changed ' + result.changedRows + ' rows');
        }
        return true;
    } catch (err) {
        console.log(err);
        throw err;
    }
}

async function create(req, res) {
    const { typeOfAnswer, description, answers, addable } = req.body;
    const newTypeOfAnswer = {
        type_of_answer: typeOfAnswer,
        description,
        addable
    };
    const query = sql.post;
    const typeOfAnswerTN = 'type_of_answer';
    const answerTN = 'answer';
    try {
        let typeOfAnswerDB = await pool.query(query[0], [typeOfAnswer, description, addable]);

        if(typeOfAnswerDB.length) throw 'DUPLICATE_ENTRY';
        for (const answer of answers) {
            let answerDB = await pool.query(query[1], [answer.value, answer.score]);
            if (answerDB.length) throw 'DUPLICATE_ENTRY';
        }
        const typeOfAnswerInserted = await pool.query(query[2], [typeOfAnswerTN, newTypeOfAnswer]);    

        if (!typeOfAnswerInserted.affectedRows) {
            res
            .status(404)
            .send({ message: "El Tipo de Respuesta no se ha guardado." });
        } else {
            console.log("Affected " + typeOfAnswerInserted.affectedRows + " rows");
            typeOfAnswerDB = await pool.query(query[0], [typeOfAnswer, description, addable]);
            typeOfAnswerDB = typeOfAnswerDB[0];
            
            for (const answer of answers) {                
                answer.idType_Of_Answer = typeOfAnswerDB.idtype_of_answer;                
                const answerInserted = await pool.query(query[2], [answerTN, answer]);
                if (!answerInserted.affectedRows) {
                    res
                        .status(404)
                        .send({ message: "La Respuesta no se ha guardado." });
                } else {
                    console.log("Affected " + answerInserted.affectedRows + " rows");
                }
            }
            
        }
    } catch (err) {
        console.log(err);
        if (err === "FOREIGN_KEYS_NOT_EXIST") {
            console.log(`Clave foranea, no existe`);
            res.status(500).send({ message: `Foreign Key doesn't exist` });
        } if (err === "DUPLICATE_ENTRY") {
            console.log(`El objeto ya existe`);
            res.status(500).send({ message: `Foreign Key doesn't exist` });
        } else {
            res.status(500).send({ message: "Error en la petición" });
        }
    }
    res.status(200).send({ message: "Se creo el tipo de respuesta" });
}
async function getAll(req, res) {
    const query = sql.get;
    let typeOfAnswer = [];
    let tmp;
    try {
        const typesOfAnswersIDsDB = await pool.query(query[0]);
        if (!typesOfAnswersIDsDB.length) {
            res.status(404).send({ message: "No hay Tipos de Respuesta !!" });
        } else {

            for (let typeOfAnswerIDDB of typesOfAnswersIDsDB) {
                console.log("wwwwwwwwww", typeOfAnswerIDDB);
                
                typeOfAnswerIDDB = typeOfAnswerIDDB.idtype_of_answer;
                const typeOfAnswerDB = await pool.query(query[1], typeOfAnswerIDDB);
                if (!typeOfAnswerDB.length) {
                    const result = await pool.query(query[2], typeOfAnswerIDDB);
                    if (!result.length) {
                        continue;
                    } else {
                        console.log("asdasdasd", result);
                        
                        tmp = {};
                        tmp.idTypeOfAnswer = result[0].idtype_of_answer;
                        tmp.typeOfAnswer = result[0].type_of_answer;
                        tmp.description = result[0].description;
                        tmp.addable = result[0].addable == true;
                        tmp.answers = [];
                        tmp.sampleValues = '';
                    }
                } else {
                    tmp = formatTypeOfAnswer(typeOfAnswerDB);
                }
                typeOfAnswer.push(tmp);
            }
            if (!typeOfAnswer.length) {
                throw {
                    status: "NOT_FOUND",
                    description: "No hay Tipos de Respuesta !!",
                    code: 404
                };
            } else {
                console.log(typeOfAnswer);
                return res.status(200).send(typeOfAnswer);
            }

        }
    } catch (err) {
        if (err.status == 'NOT_FOUND') {
            console.log(err.description);
            res.status(err.code).send({message: err.description})
        } else {
            console.log(err);
            res.status(500).send({ message: "Error en la petición.", err });
        }
    }

}
async function get(req, res) {
    const idTypeOfAnswer = req.swagger.params.idTypeOfAnswer.value;
    const query = sql.getId;
    let tmp;
    try {
        let typeOfAnswerDB = await pool.query(query[0], idTypeOfAnswer);
        if (!typeOfAnswerDB.length) {
            let typeOfAnswerDB = await pool.query(query[1], idTypeOfAnswer);
            if (!typeOfAnswerDB.length) {
                res.status(404).send({ message: "No se encontro el Tipo de Respuesta." });
            } else {
                console.log("asdasdasd", typeOfAnswerDB);
                tmp = {};
                tmp.idTypeOfAnswer = typeOfAnswerDB[0].idtype_of_answer;
                tmp.typeOfAnswer = typeOfAnswerDB[0].type_of_answer;
                tmp.description = typeOfAnswerDB[0].description;
                tmp.addable = typeOfAnswerDB[0].addable == true;
                tmp.answers = [];
                tmp.sampleValues = '';
                console.log("yupi",tmp);
                
                typeOfAnswerDB = tmp;
            }

        } else {
            tmp = formatTypeOfAnswer(typeOfAnswerDB);
        }
        console.log(tmp);
        
        return res.status(200).send( tmp );
            
    } catch (err) {
        console.log(err);        
        res.status(500).send({ message: "Error en la petición.", err });
    }
    
}
async function update(req, res) {
    const idTypeOfAnswer = req.swagger.params.idTypeOfAnswer.value;
    const { typeOfAnswer, description, answers, addable } = req.body;
    const newTypeOfAnswer = {
        type_of_answer: typeOfAnswer,
        description,
        addable
    };
    const query = sql.put;
    try {
        const rows = await pool.query(query[0], idTypeOfAnswer);
        await setAnswersErased(rows, true);
        let result = await pool.query(query[1], [newTypeOfAnswer, idTypeOfAnswer])
        if (!result.changedRows) {
            res.status(404).send({ message: 'No se encontro el Tipo de Respuesta.' });
        } else {
            console.log('changed ' + result.changedRows + ' rows');
            res.status(200).send({ message: 'Se actualizo el Tipo de Respuesta' });
        }
        
    } catch (err) {
        console.log(err);
        res.status(500).send({ message: "Error en la petición.", err });
    }


}
async function deleteTypeOfAnswer(req, res) {
    const idTypeOfAnswer = req.swagger.params.idTypeOfAnswer.value;
    const query = sql.delete;
    
    try {
        const rows = await pool.query(query[0], idTypeOfAnswer);
        await setAnswersErased(rows, true);
        const result = await pool.query(query[2], idTypeOfAnswer);
        if (!result.changedRows) {
            res.status(404).send({ message: 'No se encontro el Tipo de Respuesta' });
        } else {
            console.log('changed ' + result.changedRows + ' rows');
            res.status(200).send({ message: 'Se elimino el Tipo de Respuesta' });
        }

    } catch (err) {
        console.log(err);
        if (err == 'ANSWER_NOT_FOUND') {
            res.status(404).send({ message: 'No se encontro la Respuesta' });
        } else {
            res.status(500).send({ message: "Error en la petición.", err });            
        }
    }

    
}