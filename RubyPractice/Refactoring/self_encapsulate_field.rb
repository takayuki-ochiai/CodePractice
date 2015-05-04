#自己カプセル化フィールドに関してはいろんな議論があるようだ。
# 筆者はいろいろ不都合が起きたら関節変数アクセスに切り替えるようにしているらしい。
# 使うべきタイミングとして重要なのはスーパークラスではフィールドにアクセスしてるけど、
# サブクラスでは計算した値を使うように変数アクセスをオーバーライドしたくなったときらしい

class Item
  attr_accessor :base_price, :tax_rate

  #自己カプセル化フィールドを使うときは、初期化の時は別に直接フィールドにアクセスできるメソッドを定義したほうがいい。
  #セッターが初期かとは異なる動作を実装していることがあるから。
  def initialize(base_price, tax_rate)
    setup(base_price, tax_rate)
  end

  def setup(base_price, tax_rate)
    @base_price = base_price
    @tax_rate = tax_rate
  end

  def raise_base_price_by(percent)
    self.base_price = base_price * (1 + percent/100.0)
  end

  def total
    base_price * (1 + tax_rate)
  end
end