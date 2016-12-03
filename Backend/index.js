var express = require('express');
var bodyParser = require('body-parser');
var app = express();

//setea el puerto
app.set('port', 8000);
app.use(bodyParser.json());

var routes = require("./lib/routes");
//delega el routeo al otro modulo
routes(app);

//comienza a escuchar en el puerto
app.listen(app.get('port'), function(){
    console.log('Servidor escuchando en: http://localhost:' + app.get('port'));
});
