//console.log("Hello Node!");

// non blocking
//次の処理 (Worldを出力)を邪魔しないようにコールバック関数で最初の処理を渡す必要がある。
// setTimeout(function() {
//     console.log("hello");
// }, 2000);

// console.log("World");

//逆にブロックしているような処理
//Nodeはメインのスレッドが一つなので、この書き方をするとすべてのリクエストをブロックするというおそろしい事態になる
var start = new Date().getTime();
while(new Date().getTime() < start + 1000);
console.log("world");

//時間がかかりそうな処理はコールバック関数で実装すること