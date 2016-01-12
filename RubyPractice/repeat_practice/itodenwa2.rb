n = 16
pair = Array.new(n / 2 + 1)

pair[0] = 1

1.upto(n/2) do |i|
  pair[i] = 0
  i.times do |j|
    pair[i] += pair[j] * pair[i - j - 1]
  end
end

puts pair[n/2]
