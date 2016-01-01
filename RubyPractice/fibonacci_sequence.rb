fibonacci_sequence = [1, 1]

result = []
while result.size < 11
  next_val = fibonacci_sequence[-1] + fibonacci_sequence[-2]
  divide = next_val.to_s.split('').inject(0) { |result, val| result += val.to_i }
  result << next_val if next_val % divide == 0
  fibonacci_sequence << next_val
end

print result

# 模範解答
a = b = 1
count = 0
while count < 11
  c = a + b
  sum = 0
  c.to_s.split(//).each { |e| sum += e.to_i }
  if (c % sum == 0)
    puts c
    count += 1
  end
  a, b = b, c
end
