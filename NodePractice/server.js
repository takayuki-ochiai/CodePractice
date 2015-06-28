//Nodeが持っているhttoモジュールを読み込む
var http = require('http');
var settings = require('./settings');
var fs = require('fs');
var ejs = require('ejs');

var server = http.createServer();
var template = fs.readFileSync(__dirname + '/public_html/index.ejs', 'utf-8');
var n = 0;
server.on('request', function(req, res){
    n++;
    var data = ejs.render(template, {
        title: "hello",
        content: "<strong>World!</strong>",
        n: n
    });
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    res.end();
});
server.listen(settings.port, settings.host);
console.log("server listening...");
