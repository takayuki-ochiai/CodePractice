require 'pry'
EUROPE_ROULETTE = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5,
                  24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26]

AMERICAN_ROULETTE = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 0,
                    27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]

def max_value(roulette, range)
  sums = []
  sum = roulette[0..(range - 1)].inject(:+)
  sums << sum
  # しゃくとり法
  roulette.size.times do |n|
    sum -= roulette[n]
    if n + range < roulette.size
      sum += roulette[n + range]
    else
      sum += roulette[n + range - roulette.size]
    end
    sums << sum
  end
  sums.max
end

cnt = 0
(2..36).each do |i|
  cnt += 1 if max_value(EUROPE_ROULETTE, i) < max_value(AMERICAN_ROULETTE, i)
end
puts cnt
