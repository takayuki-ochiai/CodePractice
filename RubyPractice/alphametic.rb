#でてくる文字は READWITLKS の１０文字
cnt = 0
# result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0].permutation(10).select { |r, e, a, d, w, i, t, l, k, s|
#   next if r == 0 || w == 0 || t == 0 || s == 0
#   (1000 * r + 100 * e + 10 * a + d) + (10000 * w + 1000 * r + 100 * i + 10 * t + e) + (1000 * t + 100 * a + l * 10 + k) == (10000 * s + 1000 * k + 100 * i + 10 * l + l)
# }
# puts result.size

# cnt = 0
# (0..9).to_a.permutation do |r, e, a, d, w, i, t, l, k, s|
#   next if r == 0 || w == 0 || t == 0 || s == 0
#   read = (1000 * r + 100 * e + 10 * a + d)
#   write = (10000 * w + 1000 * r + 100 * i + 10 * t + e)
#   talk = (1000 * t + 100 * a + l * 10 + k)
#   skill = (10000 * s + 1000 * k + 100 * i + 10 * l + l)
#   cnt += 1 if read + write + talk == skill
# end
#
# puts cnt


# もうすこし拡張性高く書く

expression = "READ+WRITE+TALK==SKILL"
nums = expression.split(/[^a-z]/i)
chars = nums.join.split(//).uniq
head = nums.map { |num| num[0] }

cnt = 0
(0..9).to_a.permutation(chars.size) do |seq|
  is_zero_first = false
  if seq.include?(0)
    is_zero_first = head.include?(chars[seq.index(0)])
  end

  if !is_zero_first
    e = expression.tr(chars.join, seq.join)
    if eval(e)
      puts e
      cnt += 1
    end
  end
end

puts cnt
