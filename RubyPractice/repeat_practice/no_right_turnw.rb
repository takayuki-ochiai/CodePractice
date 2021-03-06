W = 6
H = 4
left = [0] * H
bottom = [0] * W
DIR = [[0, 1], [-1, 0], [0, -1], [1, 0]]


def search(x, y, dir, left, bottom)
  left_l = left.clone
  bottom_l = bottom.clone

  if dir == 0 || dir == 2
    pos = [y, y + DIR[dir][1]].min
    return 0 if (pos < 0) || (y + DIR[dir][1] > H)
    return 0 if left_l[pos] & (1 << x) > 0
    left_l[pos] |= (1 << x) # 縦の線を使用済みにする
  else
    pos = [x, x + DIR[dir][0]].min
    return 0 if (pos < 0) || (x + DIR[dir][0] > W)
    return 0 if bottom_l[pos] & (1 << y) > 0
    bottom_l[pos] |= (1 << x)
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
