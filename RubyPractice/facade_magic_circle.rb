require 'pry'
magic_circle = [1, 14, 14, 4, 11, 7, 6, 9, 8, 10, 10, 5, 13, 2, 3, 15]

# result = {}
# (1..magic_circle.size).each do |n|
#   magic_circle.combination(n) do |set|
#     sum = set.inject(:+)
#     if result.has_key?(sum)
#       result[sum] = result[sum] + 1
#     else
#       result[sum] = 1
#     end
#   end
# end
#
# puts result.max_by(&:last)

# 模範解答 1つづつ数を順にセットしてそこまでの和を再利用する
sum_all = magic_circle.inject(:+)

sum = Array.new(sum_all + 1){0}
sum[0] = 1
magic_circle.each do |n|
  (sum_all - n).downto(0).each do |i|
    sum[i + n] += sum[i]
  end
end
puts sum.find_index(sum.max)
