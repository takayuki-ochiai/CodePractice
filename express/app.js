// expressをロードする
var express = require('express');

// expressのアプリケーションオブジェクトを作成する
var app = express();

// getの登録を行う。第一引数にはアクセスしたパスを、第2引数には実行する関数をそれぞれ指定する。
// 第二引数のコールバックではreqestとresponseがそれぞれ引数に渡ってくる。
//　面倒なルーティングの自動化
app.get("/", function(req, res) {
  res.send('Hello Express!');
})

// 3000番ポートでリッスンする
var server = app.listen(3000, function() {
  console.log('Server Running');
})
