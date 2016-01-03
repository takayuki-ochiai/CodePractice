# require 'pry'

# squares = [4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400]
# while true
#   squares = (2..Math.sqrt(cut_num * 2).floor).map { |n| n ** 2 }
#   (1..cut_num).to_a.permutation(cut_num) do |set|
#     set.size.times do |n|
#       # 尺取り方で隣のケーキのイチゴの和を計算する
#       # ary = []
#       ans = set[0, 2].inject(:+)
#
#       next unless squares.include?(ans)
#
#       # ary << ans
#       if n + 2 < set.size - 1
#         ans += set[n + 2]
#       else
#         ans += set[n + 2 - set.size]
#       end
#       ans -= set[n]
#       next unless squares.include?(ans)
#       # ary << ans
#
#       # break if ary.all? { |n| squares.include?(n) }
#     end
#   end
#   cut_num += 1
#   puts cut_num
# end
#
# puts cut_num

def check(n, pre, log, square)
  if n == log.size
    if square.include?(1 + pre)
      puts n
      p log
      return true
    end
  else
    ((1..n).to_a - log).each do |i|
      if square.include?(pre + i)
        return true if check(n, i, log + [i], square)
      end
    end
  end
  false
end

n = 2
while true
  square = (2..Math.sqrt(n * 2).floor).map { |i| i ** 2}
  break if check(n, 1, [1], square)
  n += 1
end
