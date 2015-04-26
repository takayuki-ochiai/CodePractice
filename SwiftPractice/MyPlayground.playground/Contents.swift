//: Playground - noun: a place where people can play


var str = "Hello, playground"
var msg: String
msg = "hello World"

//自明の場合は省略可能
var test = "test"

println(msg)
// コメントを書く　あーJavaScriptっぽい書き方だよね。変数の宣言とか。
//でも型宣言するのはJavaっぽい

let s = "hoge" //定数の宣言はletをつかう

println("msg \(msg) \(s) ")
// \(変数で文字列の中で変数を展開可能)

//基本データ型は
/*
String
Int
Float/Double
Bool
nil
*/

//型変換
let a = "hkt"
let b = 48
let c = a + String(b)
//データの型で囲ってあげると型を変換できるっぽい

//タプル

let error = (404, "not found")

error.0
error.1
//
let error2 = (code:404, msg: "not found")
error2.0
error2.code
error2.msg

var colors = ["blue", "red"]

colors.count
colors.isEmpty

colors.append("green")

colors.insert("gray", atIndex: 1)

//辞書 ハッシュっぽい

var users = [
    "taguchi": 500,
    "fkoji": 800
]


users.count
users.isEmpty

users["ochiai"] = 900
users

users["taguchi"]


func sayHi(#name: String) {
    println("Hi" + name)
}

sayHi(name: "tom")

//関数の初期値

func sayHi2(#name: String = "Tom") {
    println("Hi " + name)
}

sayHi2()

sayHi2(name: "tom")

func sum(a: Int, b:Int) -> Int {
    return a + b
}

func swap(a:Int, b:Int) -> (Int, Int){
    return(b, a)
}

println(swap(5, 2))

//変数を書き換えて返す
func f(inout a:Int) {
    a = 20
}
var testNum = 3
f(&testNum)

testNum

//新しい値を返す
func f2(var b: Int) -> Int {
    return b
}

var testNum2 = 2
println(testNum2)

testNum2 = f2(testNum2)

//Swiftの関数は基本値渡し

//列挙型
enum Result: Int{
    case Success = 0
    case Error
    func getMessage() -> String {
        switch self {
        case .Success:
            return "OK"
        case .Error:
            return "NG"
        }
    }
}


Result.Error.getMessage()
Result.Success.getMessage()


//クラスを使う
// 変数はプロパティなのでいよいよJavaScriptくさい

class User {
    var name: String
    var score: Int = 0
    
    init(name: String) {
        self.name = name
    }
    //override禁止の場合はfinalをつける
    func upgrade() {
        score++
    }
    
    final func upgrade2() {
        score += 25
    }
    
    
}

var tom = User(name: "tom")

tom.name

class AdminUser: User {
    func reset() {
        score = 200
    }
    
    //オーバーライドのときは
    override func upgrade() {
        //親クラスのどのメソッドを呼び出すか選べるようだ
        super.upgrade2()
        super.upgrade()
        score += 3
    }
}


var bob = AdminUser(name: "bob")
bob.score//

bob.reset()
bob.score

bob.upgrade()

