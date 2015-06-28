//Nodeが持っているhttoモジュールを読み込む
var http = require('http');
var settings = require('./settings');
var fs = require('fs');

var server = http.createServer();
var msg;
server.on('request', function(req, res){
    //ファイルを読み込むのは時間がかかるのでコールバック関数を使う
    fs.readFile(__dirname + '/public_html/index.html', 'utf-8', function(err, data) {
        if(err) {
            res.writeHead(404, {'Content-Type': 'text/plain'});
            res.write('not found');
            //必ずresponseは終了させること
            return res.end();
        }
        res.writeHead(200, {'Content-Type': 'text/html'});

        //読み込まれたhtmlがdata変数に入っている
        res.write(data);
        //必ずresponseは終了させること
        res.end();
    });
});
server.listen(settings.port, settings.host);
console.log("server listening...");
