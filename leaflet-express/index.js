// Bibliotecas
const express = require('express'); // Biblioteca de express
const path = require('path'); // Biblioteca para saber el tipo de union de carpeta
const mysql= require('mysql'); // Biblioteca para usar mysql
//Inicialización
const servidor = express(); // Instancia de express
const port= 8000;

servidor.engine('html', require('ejs').renderFile);
servidor.set('view engine', 'html');

//Rutas
servidor.get('/',function(solicitud,respuesta){
  const db= mysql.createConnection({
    multipleStatements: true,
    host:'localhost',
    user:'cesar',
    password:'password',
    database:'tweets'
  });
  db.query('select idModulo from `Modulo`;',(err,modulo)=>{
    if(err) throw err;
    var sql="";
    for (var i = 0; i < modulo.length; i++) {
      sql+= 'select nombre,latitud,longitud,avg(Sentimientos_idSentimientos) as promedio from `Tweets` as t inner join `Modulo` as m on t.`Modulo_idModulo`= m.`idModulo`  where `Modulo_idModulo`='+ modulo[i].idModulo+';';
    }
    db.query(sql,(err,datos)=>{
      if(err) throw err;
      db.end();
      respuesta.locals={modulo: datos};
      respuesta.render(path.join(__dirname,'mapa.html'));
    });
  });
});
servidor.use(express.static(path.join(__dirname,'public')));
//Iniciar el servidor
servidor.listen(port, function () {
   console.log('Servidor corriendo en http://localhost:'+port);
});
