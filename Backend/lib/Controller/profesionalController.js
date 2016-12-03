//controlador del objeto profesional: modulo intermedio entre las rutas y el acceso a la bd

var profesionalDAO = require("../DAO/profesionalDAO");


module.exports.getRaiz=function (callback) {
    console.log("raiz");
    profesionalDAO.raiz(callback);

}


module.exports.getProfesionalPorId = function(params, callback){
    console.log("Obteniendo profesional con id: " + params.id);
    profesionalDAO.buscarProfesionalPorId(params.id, callback);
}



