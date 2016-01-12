n = 16
# ペアが0~8組できるパターン(9個)を考慮する
pair = Array.new(n / 2 + 1)

# ペアができないのは0人のときだけなので1通り
pair[0] = 1

# 1ペア~8ペアのときの結果
1.upto(n/2) do |i|
  # 初期化
  pair[i] = 0
  puts "次のi"

  # 領域の分け方のパターン分繰り返す
  # 右側がaペアできて左側がbペアできるとき・・・みたいなイメージ
  i.times do |j|
    puts "pair[#{i}] += pair[#{j}] * pair[#{i - j - 1}]"
    puts "pair[#{i}] += #{pair[j]} * #{pair[i - j - 1]}"
    pair[i] += pair[j] * pair[i - j - 1]
  end
end

puts pair[n/2]
