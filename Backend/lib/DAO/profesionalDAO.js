
var mysql = require('mysql');

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'pass',
    database : 'SaludFeminista',
});


module.exports.raiz= function (callback) {
    var data = {
        "Data":""
    };
    data["Data"] = "Raiz de la app";
    callback(data);

}


