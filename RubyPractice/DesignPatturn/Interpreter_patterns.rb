#専用の言語を作り、それを解釈して出力を得るための特殊なパターン
# 簡単に言えば、Interpreter パターンは特定な言語において、何らかのフォーマットで定義された文書やテキストなどを解釈するための特殊なパターン。
# 例：“1+1/2”という文字列をJava言語で解釈させ、解釈結果として1.5を出力する
# Interpreter パターンはこのようなユースケースを実現するための最適な方法。

#問題領域が明確で自己完結する傾向があったり複雑なオブジェクトの設定が必要だったりする場合、あるいは多くのバラバラのコードの群れが存在していてそのコードが書くこと自体はとても簡単でもそれらの組み合わせが増え続けていると気づく場合。

#例として様々な形式やサイズの多くのファイルを管理するためのプログラムを作成する

#ファイルの拡張子やサイズ、書き込み可能かといった特定の特徴の組み合わせで共有するファイルを検索できるようにするためのコード

require "find"

class Expression
  #一般的な式のコードをここに追加
end

#単純に与えられたディレクトリの下にあるすべてのファイルを集めるためのクラス
class All < Expression
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p) #ファイルだけ見たいのでディレクトリはここで取り除いている
      results << p
    end
    results
  end
end

class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      name = File.basename(p)
      results << p if File.fnmatch(@pattern, name)
    end
  end
end

#FileNameクラスは@patternの中身の文字列にファイル名がマッチした場合にヒットさせるためのクラス
expr_all = All.new
files = expr_all.evaluate("test_dir")

#すべてのファイルdえなくMP3のみが欲しい場合
expr_mp3 = FileName.new('*.mp3')
mp3s = expr_mp3.evaluate('test_dir')

#指定されたサイズより大きいファイルを検索したいといったときや書き込み可能なファイルを検索する場合は以下のようになる

class Bigger < Expression
  def initialize(size)
    @size = size
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p if File.size(p) > @size
    end
    results
  end
end

class Writable < Expression
  def evaluate(dir)
    results = []
    File.find(dir) do |p|
      next unless File.file?(p)
      results << p if ( File.writable?(p) )
    end
  end
end

#上記のクラスがインタプリタにおけるASTの終端となる。
#書き込み可能ではないファイルを検索したい場合はどうするべきか
#終端のNotWritableを作る必要もあるけど、それじゃ終端にたいしてすべてNotを付加する必要が有る
#なので非終端Notを作る

class Not < Expression
  def  initialize(expression)
    @expression = expression
  end

  def evaluate(dir)
    All.new.evaluate(dir) - @expression.evaluate(dir)
  end
end

#Notクラスのコンストラクタは別のファイル検索のクラスを受け取り、すべてのファイルから入れられたクラスで検索された条件以外のものを返すことで否定条件での検索を可能にする
#このクラスのいいところはWritable専用といったことではなくあらゆるASTの終端に使えることである
expr_not_writable = Not.new( Writable.new )
readonly_files = expr_not_writable.evaluate('test_dir')

#二つのファイル検索式の結果を結合する
class Or < Expression
  def initialize(expression1, expression2)
    @expression1 = expression1
    @expression2 = expression2
  end

  def evaluate(dir)
    result1 = @expression1.evaluate(dir)
    result2 = @expression2.evaluate(dir)
    (result1 + result2).sort.uniq
  end
end

#二つのファイル検索式の結果を同時に満たすものを返す

class And < Expression
  def initialize(expression1, expression2)
    @expression1 = expression1
    @expression2 = expression2
  end

  def evaluate(dir)
    result1 = @expression1.evaluate(dir)
    result2 = @expression2.evaluate(dir)
    (result1 & result2)
  end
end

big_or_mp3_expr = Or.new(Bigger.new(1024), FileName.new('*.mp3'))
big_or_mp3s = big_or_mp3_expr.evaluate('test_dir')

complex_expression = And.new(
                                            And.new(Bigger.new(1024), FileName.new('*.mp3')),
                                            Not.new(Writable.new))

#一旦上記のような複雑なクエリを作っても、別のコンテキストでそれを繰り返しつかうことができる

complex_expression.evaluate("test_dir")
complex_expression.evaluate('/tmp')