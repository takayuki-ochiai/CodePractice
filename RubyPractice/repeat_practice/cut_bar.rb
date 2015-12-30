# 棒の切り分け

def cut_bar(n, m, current)
  if n <= current
    0
  elsif current >= m
    1 + cut_bar(n, m, current + m)
  else
    1 + cut_bar(n, m, current * 2)
  end
end

puts cut_bar(20, 3, 1)
puts cut_bar(100, 5, 1)
