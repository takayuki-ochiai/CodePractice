# 1000円を両替する時のパターンを求める
coins = [10, 50, 100, 500]
cnt = 0
(2..15).each do |i|
  coins.repeated_combination(i).each do |coin_set|
    cnt += 1 if coin_set.inject(:+) == 1000
  end
end
