# 棒の切り分け

# 棒の本数
# 最初の棒の長さ n
# 人数 m

# ある時点での棒の数は 1回目から現時点までの累計の切断回数 + 1
# と表現することができる
# 棒の数は最大何人切断に参加できるかの回数となる

def cut_bar(m, n, current)
  if current >= n
    0 # 切り終えた
  elsif current < m
    1 + cut_bar(m, n, current * 2) # 次は現在の２倍
  else
    1 + cut_bar(m, n, current + m) # 次は現在の2倍
  end
end

# while true
#   if sticks.size < m
#     # 棒の数だけしか切断に参加できない
#     sticks.size.times do
#       sticks.select do |stick|
#         stick != 1
#       end
#     end
#   else
#     # 最大人数の数だけしか切断に参加できない
#
#   end
#   phase += 1
# end
