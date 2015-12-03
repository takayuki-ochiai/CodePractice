// expressをロードする
var express = require('express');
var ejs = require('ejs');
// expressのアプリケーションオブジェクトを作成する
var app = express();

//テンプレートエンジンの設定。今回はejs。ビュー用のファイルはviewsに配置する規約となっている。
app.engine('ejs', ejs.renderFile)

// getの登録を行う。第一引数にはアクセスしたパスを、第2引数には実行する関数をそれぞれ指定する。
// 第二引数のコールバックではreqestとresponseがそれぞれ引数に渡ってくる。
//　面倒なルーティングの自動化
app.get("/", function(req, res) {
  // views内なら指定されたファイル名のファイルを探して自動でレンダリングしてくれる
  res.render('test.ejs',
    {
      title: 'Test Page',
      content: 'これはテストです'
    }
  );
});

// 3000番ポートでリッスンする
var server = app.listen(3000, function() {
  console.log('Server Running');
})
