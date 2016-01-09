
def count_zero(this_step, depth, count, target)
  count += this_step.count(0)
  return depth if count >= target
  next_step = this_step.each_cons(2).map { |a, b| a ^ b }
  next_step.push(1).unshift(1)
  count_zero(next_step, depth + 1, count, target)
end

puts count_zero([1, 1], 2, 0, 2014)

# 模範解答
# 1つの行の両端に「１」をセットし、その間の数を上の行から決定する
# 行をビット列として1と0で表現する。
# 次の行は前の行を1ビット左にシフトしたものと前の行の排他的論理和で求められる

count = 0
line = 1
row = 1
while count < 2014
  row ^= row << 1
  count += row.to_s(2).count("0")
  line += 1
end

puts line
