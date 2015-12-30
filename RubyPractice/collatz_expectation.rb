# cnt = 0
# (2..10000).each do |num|
#   # 偶数かつ３の倍数でないもののみ判定する
#   next if num.odd? || num % 3 == 0
#   process = num * 3 + 1
#   try_num = 0
#
#   while process != 1 do
#     process = process.even? ? process / 2 : process * 3 + 1
#     cnt += 1 if process == num
#     break if process == num
#   end
#   puts num if num == process
# end
#
# puts "result is #{cnt}"


# 模範解答?
def is_loop(n)
  check = n * 3 + 1
  # コラッツの予想によってあらゆる自然数は下記の条件で演算すると必ず1に到達する
  while check != 1 do
    check = check.even? ? check / 2 : check * 3 + 1
    return true if check == n
  end
  false
end

# 波括弧とdo endでは結果が違ってくるので注意
puts 2.step(10000, 2).count{ |i|
  is_loop(i)
}
