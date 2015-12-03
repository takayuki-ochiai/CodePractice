var http = require('http');
var fs  = require('fs');

var server = http.createServer();
server.on('request', doRequest);
server.listen(1234);
console.log('Server running');

// request　http.IncomingMessageというオブジェクトでクライアントからのリクエストに関する機能がまとめられている

// response http.serverResponseというオブジェクトでサーバーからクライアントへ戻されるレスポンスに関する機能がまとめられている
function doRequest(req, res) {
  fs.readFile('./sample.html', 'UTF-8',
    function(err, data) {
      //dataにはsample.htmlのデータが入っている
      res.writeHead(200, {'Content-Type': 'text/html'})
      res.write(data);
      res.end();
    }
  );

  // readFileは非同期なので、#writeHeadや#endをコールバックの外に出すと処理の順番がぐちゃぐちゃになって動かない
}
