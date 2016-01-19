# n台の電気機器がある
# テーブルタップは口数が2つのものと3つのものがある
# そのときのテーブルタップの配置の組み合わせを求める
# 漸化式か何かで一般化できるのでは？
# 2は1通り,3は

N = 20
@memo = {1 => 1}
def set_tap(remain)
  return @memo[remain] if @memo.has_key?(remain)
  cnt = 0
  # 2口
  (1..(remain / 2)).each do |i|
    cnt += set_tap(remain - i) * set_tap(i)
  end

  # 3口
  (1..(remain / 3)).each do |i|
    (1..((remain - i) / 2)).each do |j|
      cnt += set_tap(remain - (i + j)) * set_tap(j) * set_tap(i)
    end
  end
  @memo[remain] = cnt
end

puts set_tap(N)
