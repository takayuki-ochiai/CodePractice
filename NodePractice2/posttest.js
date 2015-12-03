var http = require('http');
var fs = require('fs');
var ejs = require('ejs');
// urlの文字列をパースして必要なものを取り出す機能を提供してくれる。
var url = require('url');
var qs = require('querystring')

var template = fs.readFileSync('./template.ejs', 'utf8');
var content1 = fs.readFileSync('./content1.ejs', 'utf8');
var content2 = fs.readFileSync('./content2.ejs', 'utf8');
var content3 = fs.readFileSync('./content3.ejs', 'utf8');



/**
 * ルーティング情報用の連想配列
 */

var routes = {
  "/": {
    "title": "Main page",
    "message": "サンプルページですよ",
    "content":content1
  },
  "/index": {
    "title": "Main page",
    "message": "メインページですよ",
    "content":content1
  },
  "/other": {
    "title": "Sample page",
    "message": "別のページですよ",
    "content":content2
  },
  "/post": {
    "title": "Post Page",
    "content": content3
  }
}

var server = http.createServer();
server.on('request', doRequest);

server.listen(1234);
console.log("Server listen");


function doRequest(req, res) {
  // URLのパース処理　URLの文字列を要素ごとに分割してオブジェクト化して返してくれる
  var url_parts = url.parse(req.url);


  if (req.method === 'GET') {
    // ルートエラーチェック
    if (routes[url_parts.pathname] === null) {
      console.log("Not found page:" + req.url);
      res.writeHead(200, {'Content-type':'text/html'});
      res.end("<html><body><h1>NOT FOUND PAGE</h1></body></html>");
      return;
    }

    // ページのレンダリング
    var content = ejs.render(template,
      {
        title: routes[url_parts.pathname].title,
        content: ejs.render(routes[url_parts.pathname].content,
          {
            message: routes[url_parts.pathname].message
          }
        )
      }
    );

    res.writeHead(200,{'Content-type':'text/html'});
    res.write(content);
    res.end();
  }
  if (req.method === 'POST') {
    if (url_parts.pathname === '/post') {
      var body = '';
      req.on('data', function (data) {
        body += data;
      })

      req.on('end', function(){
        var post = qs.parse(body);
        var content = ejs.render(template, {
          title: routes[url_parts.pathname].title,
          content: ejs.render(routes[url_parts.pathname].content, {
            idname: post.idname,
            password: post.password
          })
        })
      })
    } else {
      response.writeHead(200, {'Content-type':'text/plain'});
      response.write("NO-POST!");
      response.end();
    }
  }

}
