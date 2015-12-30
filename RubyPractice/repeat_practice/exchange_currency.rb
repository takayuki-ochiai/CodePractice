
currency = 1000

coins = [500, 100, 50, 10]
cnt = 0
(2..15).each do |i|
  coins.repeated_combination(i).each do |coin_set|
    cnt += 1 if coin_set.inject(:+) == currency
  end
end
puts cnt
