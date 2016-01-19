# 抵抗の数だけ次の抵抗の使い方を決定するメソッドを考える
# a + (a + a)とa + aを比較する
# 直列連結するか並列連結するか、すでに並列連結している部分に追加するか？
golden_ratio = (1 + Math.sqrt(5)) / 2
# 要素を追加するか最後の要素を配列化して追加するか

R_NUM = 10
def resistance(resistances)
  # 直列抵抗の数を数える
  sum = resistances.count(1)
  # 配列の中身は抵抗の逆数
  parallel_resistances = resistances.select { |resistance| resistance.instance_of?(Array) }
  unless parallel_resistances.empty?
    parallel_resistances.each do |parallel_resistance|
      sum += 1 / resistance(parallel_resistance).to_f
    end
  end
  sum
end

# def golden_resistance(resistances, rest_resistance, target_ratio)
#   # 抵抗が１０個繋がっていたら抵抗を算出する
#   return resistance(resistances) if rest_resistance == 0
#   # 次の抵抗をつなげかたを考え、目標の抵抗値に近いものを採用する
#   # 直列の場合
#   resistance(resistances + [1])
#   # 並列の場合
#   resistance(resistances.map {})
#
# end

# puts resistance([1, [1, [1, [1, 1]]]])

# ギブアップ
# 模範解答

# 配列の直接を計算
def product(ary)
  result = ary[0]
  1.upto(ary.size - 1) { |i|
    result = result.product(ary[i])
  }
  result.map { |r| r.flatten }
end

# 並列の場合の抵抗値を算出
def parallel(ary)
  #1.0 / ary.map{ |i| 1.0 / i }.inject(:+)
  Rational(1, ary.map{ |i| 1.0 / i }.inject(:+))
end

@memo = {1 => [1]}
def calc(n)
  return @memo[n] if @memo.has_key?(n)

  # 直列
  result = calc(n - 1).map{ |i| i + 1 }
  # 並列
  2.upto(n) do |i|
    # 並列で区切る個数を設定
    cut = {}
    (1..(n - 1)).to_a.combination(i - 1) do |ary|
      pos = 0
      r = []
      ary.size.times do |j|
        r.push(ary[j] - pos)
        pos = ary[j]
      end
      r.push(n - pos)
      cut[r.sort] = 1
    end

    # 区切った位置で再帰的に抵抗を設定
    keys = cut.keys.map do |c|
      c.map { |e| calc(e) }
    end

    # 抵抗値を計算
    keys.map { |k| product(k)}.each do |k|
      k.each{ |vv| result.push(parallel(vv))}
    end
  end
  @memo[n] = result
end

min = Float::INFINITY

calc(10).each do |i|
  min = i if (golden_ratio - i).abs < (golden_ratio - min).abs
end

puts sprintf("%.10f", min)
puts min
