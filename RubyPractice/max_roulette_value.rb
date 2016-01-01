EUROPE_ROULETTE = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5,
                  24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26]

AMERICAN_ROULETTE = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 0,
                    27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]


def sum_max(roulette, n)
  sum_values = []
  roulette.size.times do |index|
    # indexの位置から開始してn個隣までの値の和
    sum = 0
    n.times do |m|
      if index + m <= roulette.size - 1
        sum += roulette[index + m]
      else
        sum += roulette[index + m - roulette.size]
      end
    end
    sum_values << sum
  end
  sum_values.max
end

result = 0
(2..36).each do |n|
  # ヨーロピアンスタイルでの和の最大値がアメリカンスタイルの和の最大値よりも小さくなるnがいくつあるか
  result += 1 if sum_max(EUROPE_ROULETTE, n) < sum_max(AMERICAN_ROULETTE, n)
end

puts result

# 模範解答　しゃくとり法の利用
def sum_max2(roulette, n)
  ans = roulette[0, n].inject(:+)
  tmp = ans
  # 最初の区間は普通に加算をし、次の区間の先頭の一つ手前を引き、新たに加わる区間の末尾を加算する
  roulette.size.times do |i|
    tmp += roulette[(i + n) % roulette.size]
    tmp -= roulette[i]
    ans = [ans, tmp].max
  end
  ans
end
