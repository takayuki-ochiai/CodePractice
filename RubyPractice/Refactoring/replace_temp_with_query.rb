def price
  base_price * discount_factor
end

def base_price
  @quantity * @item_price
end

def discount_factor
  base_price > 1000 ? 0.95 : 0.98
end

#気づき： なんでもかんでも問い合わせメソッドにしていいものかと思ったのだが、確かにこうやって書くとif文がなくなってシンプルに見える。
#ローカル変数をメソッド化してなくすことで他の処理も切り出しやすく、抽出しやすいメソッドになるわけか。

#リファクタリングの本によると、一時変数が一度だけしか代入されず、代入される値を生成する式に副作用がないときなどに有効であるそうだ。
#これは習慣化しよう。