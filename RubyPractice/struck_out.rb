@memo = {}
def struck_out(panel)
  return 1 if panel.size == 0
  return @memo[panel] if @memo.has_key?(panel)
  cnt = 0
  # 次に抜くパネルのパターンを考える
  # 1枚だけ抜く場合
  (1..9).each do |n|
    cnt += struck_out(panel - [n]) if panel.include?(n)
  end
  # 2枚抜きの場合
  double = [[1,2], [2,3], [1,4], [3,6], [4,7], [6,9], [7,8], [8,9]]
  double.each do |set|
    cnt += struck_out(panel - set) if set.all? { |n| panel.include?(n) }
  end
  @memo[panel] = cnt
  cnt
end

puts struck_out([1, 2, 3, 4, 5, 6, 7, 8, 9])
