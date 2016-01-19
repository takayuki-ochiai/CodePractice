require 'pry'
W, H = 6, 6

left = [0] * H # たての線を使用したかビット単位で保管
bottom = [0] * W # 横の線を使用したかビット単位で保管

def search(x, y, left, bottom, is_return)
  cnt = 0
  [[0, 1], [1, 0]].each_with_index do |dir, i|
    left_l = left.clone
    bottom_l = bottom.clone
    # 境界を超えた場合、または使用済みの場合は進めない
    if i == 0 # 上に移動した場合
      # puts "上"
      next if (y + dir[1] < 0) || (y + dir[1] > H)
      next if left_l[y] & (1 << x) > 0
      left_l[y] |= (1 << x) # 縦の線を使用済みにする
    else
      # 右に移動した場合
      # puts "右"
      next if (x + dir[0] < 0) || (x + dir[0] > W)
      next if bottom_l[x] & (1 << y) > 0
      bottom_l[x] |= (1 << y)
    end
    next_x, next_y = x + dir[0], y + dir[1]
    if (next_x == W) && (next_y == H)
      # puts "目的地着"
      return 1 if is_return
      reverse_bottom = bottom_l.map{ |n| n.to_s(2).rjust(W + 1, '0').reverse.to_i(2) }
      reverse_left = left_l.map{ |n| n.to_s(2).rjust(H + 1, '0').reverse.to_i(2) }
        cnt += search(0, 0, reverse_left, reverse_bottom, true)
    else
      cnt += search(next_x, next_y, left_l, bottom_l, is_return)
    end
  end
  cnt
end

puts search(0, 0, left, bottom, false)
