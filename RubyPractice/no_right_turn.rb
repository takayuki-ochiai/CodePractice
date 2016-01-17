W, H = 3, 2
DIR = [[0, 1], [-1, 0], [0, -1], [1, 0]] # 移動方向

left = [0] * H # たての線を使用したかビット単位で保管
bottom = [0] * W # 横の線を使用したかビット単位で保管

def search(x, y, dir, left, bottom)
  left_l = left.clone
  bottom_l = bottom.clone
  # 境界を超えた場合、または使用済みの場合は進めない
  if dir == 0 || dir == 2 # 上下に移動した場合
    # 上に移動するときは移動後から見て下、下に移動するときは移動後からみて上の道を使用済にする
    pos = [y, y + DIR[dir][1]].min
    return 0 if (y + DIR[dir][1] < 0) || (y + DIR[dir][1] > H) #移動後の位置が境界を超えていないか
    return 0 if left_l[pos] & (1 << x) > 0
    left_l[pos] |= (1 << x) # 縦の線を使用済みにする
  else
    # 右に移動するときは移動後から見て左、左に移動するときは移動後からみて右の道を使用済にする
    pos = [x, x + DIR[dir][0]].min # 次に移動する道路の位置？
    return 0 if (x + DIR[dir][0] < 0) || (x + DIR[dir][0] > W)
    return 0 if bottom_l[pos] & (1 << y) > 0
    bottom_l[pos] |= (1 << y)
  end
  next_x, next_y = x + DIR[dir][0], y + DIR[dir][1]
  return 1 if (next_x == W) && (next_y == H) #Bに着いたら終了

  cnt = 0
  # 直進
  cnt += search(next_x, next_y, dir, left_l, bottom_l)

  # 左折
  dir = (dir + 1) % DIR.size
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  cnt
end

puts search(0, 0, 3, left, bottom)
