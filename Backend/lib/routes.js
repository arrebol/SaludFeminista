var profesionalController = require("./Controller/profesionalController");

module.exports = function(app){


    //define las rutas

    app.get('/',function(req,res){
        profesionalController.getRaiz(function (resultados) {res.json(resultados);
        })
    })



}
