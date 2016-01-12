W, H = 10, 10
parking = Array.new(W + 2){Array.new(H + 2){1}}

(W + 2).times do |w|
  parking[w][0] = parking[w][-1] = 9
end

(H + 2).times do |h|
  parking[0][h] = parking[-1][h] = 9
end

@goal = Marshal.load(Marshal.dump(parking))
@goal[1][1] = 2

start = Marshal.load(Marshal.dump(parking))
start[-2][-2] = 2


def search(prev, depth)
  target = []
  prev.each do |parking, w, h|
    [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |dw, dh|
      nw, nh = w + dw, h + dh
      if parking[nw][nh] != 9
        temp = Marshal.load(Marshal.dump(parking))
        temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h]
        if !@log.has_key?([temp, nw, nh])
          target.push([temp, nw, nh])
          @log[[temp, nw, nh]] = depth + 1
        end
      end
    end
  end

  return if target.include?([@goal, W, H])
  search(target, depth + 1) if target.size > 0
end

@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0

search([[start, W, H - 1], [start, W - 1, H]], 0)
puts @log[[@goal, W, H]]
