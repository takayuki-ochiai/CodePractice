

N = 12
# メモと現在地と残り移動回数を入力してパターンを計算する
def move(log)
  # 12回目の移動が成立した時点で１パターンと数える
  return 1 if log.size == N + 1

  cnt = 0
  # 前後左右に移動
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |d|
    # 次の座標を表現
    next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
    # 次の座標が行ったことがある場所か
    unless log.include?(next_pos)
      # 行ったことがないならメモに次の場所を追加して、再帰的に移動パターンを計算するロジックを書く
      cnt += move(log + [next_pos])
    end
  end
  cnt
end

puts move([[0, 0]])
