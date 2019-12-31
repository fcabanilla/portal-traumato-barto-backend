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
            .send({ message: "El Tipo de pregunta no se ha guardado." });
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
                        .send({ message: "La Pregunta no se ha guardado." });
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
    res.status(200).send({ message: "Se creo la Pregunta" });

}
async function getAll(req, res) {
    const query = sql.get;
    try {
        typesOfAnswersDB = await pool.query(query);
        if (!typesOfAnswersDB.length) {
            res.status(404).send({ message: "No hay Tipos de Pregunta !!" });
        } else {
            return res.status(200).send({ typesOfAnswersDB });
        }
    } catch (err) {
        res.status(500).send({ message: "Error en la petición.", err });
    }
}
async function get(req, res) {
    const idTypeOfAnswer = req.swagger.params.idTypeOfAnswer.value;
    const query = sql.getId;
    try {
        let typeOfAnswerDB = await pool.query(query, idTypeOfAnswer);
        if (!typeOfAnswerDB.length) {
            res.status(404).send({ message: "No se encontro el Tipo de Pregunta." });
        } else {
            return res.status(200).send({ typeOfAnswerDB });
        }
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
        answers,
        addable
    };
    const query = sql.put;


}
async function deleteTypeOfAnswer(req, res) {
    const idTypeOfAnswer = req.swagger.params.idTypeOfAnswer.value;
    const query = sql.delete;

    
}