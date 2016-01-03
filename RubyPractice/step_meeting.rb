require 'pry'
# 10段の階段で同じように移動した時２人が同じ段に止まるのは何通り？
# 一回の移動ごとの成功パターンの数を返す

# AとBの段数の差
# 終了条件 移動で差が0になったときは成功パターンに1加算
# 終了条件 移動で差が0より小さくなった時（すれ違った時）は失敗パターンなので0加算
# 再帰条件 移動で差が0より大きい場合(まだ段数に余裕がある場合)
# def move(diff)
#   cnt = 0
#   (1..4).to_a.repeated_permutation(2) do |set|
#     cnt += 1 if set[0] + set[1] == diff
#     cnt += move(diff - set[0] - set[1]) if set[0] + set[1] < diff
#   end
#   cnt
# end

# 自分の解答を改良
@my_memo = {}
def move(diff)
  cnt = 0
  (1..4).to_a.repeated_permutation(2) do |set|
    if @my_memo.has_key?(diff - set[0] - set[1])
      cnt += @my_memo[diff - set[0] - set[1]]
      next
    end
    cnt += 1 if set[0] + set[1] == diff
    cnt += move(diff - set[0] - set[1]) if set[0] + set[1] < diff
  end
  @my_memo[diff] = cnt
  cnt
end

# puts move(22)
# 模範解答その１ メモ化
N = 10
STEPS = 4

@memo = {}

def move2(a, b)
  return @memo[[a, b]] if @memo.has_key?([a, b])
  return @memo[[a, b]] = 0 if a > b # AさんがBよりも上になれば終了
  return @memo[[a, b]] = 1 if a == b # 同じ段にとまればカウント
  cnt = 0
  (1..STEPS).each do |da|
    (1..STEPS).each do |db|
      cnt += move2(a + da, b - db)
    end
  end
  @memo[[a, b]] = cnt
end

puts move2(0, 1000)
# 527513


# 模範解答 動的計画法による実装
# n = 22
# dp = Array.new(n + 1, 0)
# cnt = 0
# dp[n] = 1 # 初期値をセット
# n.times do |i|
#   (n + 1).times do |j|
#     (1..STEPS).each do |k|
#       break if k > j
#       dp[j - k] += dp[j]
#     end
#     dp[j] = 0 # 移動元はクリア
#   end
#   cnt += dp[0] if i % 2 == 1 # 偶数回の移動で逆に到着
# end

# puts cnt
