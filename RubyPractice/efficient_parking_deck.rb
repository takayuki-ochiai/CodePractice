# 駐車場の配置の外側に番兵として9という数字をセット、他の車がある位置を1,目的の車がある位置を2と表現。車が止まっていない位置をパラメーターとして渡す
W, H = 10, 10

parking = Array.new(W + 2){Array.new(H + 2){1}}
# print parking

# 駐車場の配置を設定（周囲に番兵として9をセット)
# 左辺と右辺の番兵設定
(W + 2).times do |w|
  parking[w][0] = parking[w][H + 1] = 9
end

# 上辺と下辺の番兵設定
(H + 2).times do |h|
  parking[0][h] = parking[W + 1][h] = 9
end

# ゴールは左上に目的の車がある状態
@goal = Marshal.load(Marshal.dump(parking))
@goal[1][1] = 2

# 開始位置は右下に目的の車がある状態
start = Marshal.load(Marshal.dump(parking))
start[W][H] = 2

def search(prev, depth)
  target = []
  prev.each do |parking, w, h|
    # wとhは車が止まっていない位置
    # 上下左右に空車の位置を移動
    [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |dw, dh|
      # nwとnhは次の空車の位置
      nw, nh = w + dw, h + dh
      if parking[nw][nh] != 9
        # 番兵以外の場合過去に調べていないか調査
        temp = Marshal.load(Marshal.dump(parking))
        # 現在の空車の位置と次の空車の位置の状態を入れ替える
        temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h]
        # 目的の車の位置と空車の位置について過去に調べたことがないかを判定する
        if !@log.has_key?([temp, nw, nh])
          # 過去に調べていないものを調査対象に追加
          target.push([temp, nw, nh])
          # 特定の位置に何手で到達するかをメモする
          @log[[temp, nw, nh]] = depth + 1
        end
      end
    end
  end

  # 逆算してるのでゴールは一番奥に車があって入り口が空車になっている状態
  return if target.include?([@goal, W, H])
  search(target, depth + 1) if target.size > 0
end

@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0

# 開始位置から探索開始
search([[start, W, H - 1], [start, W - 1, H]], 0)

# ゴールまでの探索数を出力
puts @log[[@goal, W, H]]
