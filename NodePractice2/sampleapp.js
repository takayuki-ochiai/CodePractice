var http = require('http');

var server = http.createServer();
server.on('request', doRequest);
server.listen(1234);
console.log('Server running');

// request　http.IncomingMessageというオブジェクトでクライアントからのリクエストに関する機能がまとめられている

// response http.serverResponseというオブジェクトでサーバーからクライアントへ戻されるレスポンスに関する機能がまとめられている
function doRequest(req, res) {
  res.writeHead(200, {'Content-Type': 'text-plain'});
  res.write('Hello Node!');
  res.end();
}
