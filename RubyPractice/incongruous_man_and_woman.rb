# MALE = 0
# FEMALE = 1
#
# sex = [MALE, FEMALE]

# 性別に対して合計30個の要素の配列を作る重複順列を考えて、絞り込む方法は
# 計算コストが高すぎてだめだった
# 1073741824通りに対してselect文掛けるのはきつい
# arrival_order = sex.repeated_permutation(30).select do |sex_set|
#   cnt += 1
#   puts cnt
#   sex_set.count(MALE) == 20
# end

# puts arrival_order.size

# 到着順を経路として考える
boy, girl = 20, 10
# 0人から数えるので1追加
boy, girl = boy + 1, girl + 1

ary = Array.new(boy * girl){0}
ary[0] = 1
girl.times do |g|
  boy.times do |b|
    # この条件が肝
    # 特定のタイミングで男女の人数が同じではないかつ,男子の残り人数と女子の残り人数が同じではない
    if (b != g) && (boy - b != girl - g)
      # 左からくるパターンの数を追加
      ary[b + boy * g] += ary[b - 1 + boy * g] if b > 0
      # 下からくるパターンの数を追加
      ary[b + boy * g] += ary[b + boy * (g - 1)] if g > 0
    end
  end
end

puts ary[-2]
puts ary[-boy - 1]
puts ary[-1]
