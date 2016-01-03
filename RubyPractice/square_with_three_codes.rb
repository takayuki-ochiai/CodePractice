answer = []
(1..500).each do |i|
  # 四角形の各辺は整数でなければならないため、４で割れないものは除外
  next if i % 4 != 0

  square = (i / 4)**2
  side = i / 2

  area_set = []
  (1..(side - 1)).each do |j|
    area_set << j * (side - j)
  end
  area_set.uniq!

  area_set.repeated_combination(2) do |set|
    if set[0] + set[1] == square
      answer.push([1, set[0] / set[1].to_f, square / set[1].to_f])
    end
  end
end

answer.uniq!
puts answer.size

# 模範解答　こっちのほうがシンプル
# MAX = 500
# answer = []
#
# (1..MAX / 4).each do |c| # cは正方形の1辺を表す。
#   edge = (1..(c - 1)).to_a.map { |tate| tate * (2 * c - tate) }
#   edge.repeated_combination(2) do |a, b|
#     if a + b == c ** 2
#       # 整数倍した組み合わせは除く
#       answer.push([1, b / a.to_f, c * c / a.to_f])
#     end
#   end
# end
#
# answer.uniq!
# puts answer.size
