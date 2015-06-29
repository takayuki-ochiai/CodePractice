//Nodeが持っているhttoモジュールを読み込む
var http = require('http');
var settings = require('./settings');
var fs = require('fs');
var ejs = require('ejs');
//投稿を受け取るためのモジュール
var qs = require('querystring');

var server = http.createServer();
var template = fs.readFileSync(__dirname + '/public_html/bbs.ejs', 'utf-8');
var n = 0;

//投稿を保持しておくための配列
var posts = [];

function renderForm(posts, res) {
    var data = ejs.render(template, {
        posts: posts
    });
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    res.end();
}
server.on('request', function(req, res){
    if(req.method === 'POST') {
        //リクエストデータ初期化
        req.data = "";
        //読み込み中のイベントはreadableで取れる
        req.on("readable", function() {
            req.data += req.read();
        });
        //すべてのイベントが終わったらはendで取れる
        req.on("end", function() {
            var query = qs.parse(req.data);
            posts.push(query.name);
            renderForm(posts, res);
        });
    } else {
        renderForm(posts, res);
    }
    // n++;
    // var data = ejs.render(template, {
    //     title: "hello",
    //     content: "<strong>World!</strong>",
    //     n: n
    // });
    // res.writeHead(200, {'Content-Type': 'text/html'});
    // res.write(data);
    // res.end();
});
server.listen(settings.port, settings.host);
console.log("server listening...");
