num = 2
while num += 1
  str = ('%10.10f'%Math.sqrt(num)).sub('.', '')[0..9]
  break if str.split('').uniq.length == 10
end

puts num

num = 2
while num += 1
  str = ('%10.10f'%Math.sqrt(num)).sub(/\d*\./, '')[0..9]
  break if str.split('').uniq.length == 10
end

puts num
