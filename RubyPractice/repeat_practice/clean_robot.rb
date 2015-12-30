pos = [0, 0]
log = []
log << pos

def move(move_times, log)
  return 1 if move_times + 1 == log.size
  cnt = 0
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |direction|
    next_pos = [log[-1][0] + direction[0], log[-1][1] + direction[1]]
    unless log.include?(next_pos)
      # log << next_pos
      #  logはloop内で共通なので、logとは別の配列を作ってやる必要がある
      # log + [next_pos]でも可
      new_log = log.clone << next_pos
      cnt += move(move_times, new_log)
    end
  end
  cnt
end

puts move(12, log)

# next_pos = [1, 0]

# log << next_pos
# print log
# print log + [next_pos]
