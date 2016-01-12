N = 6
max_cnt = 0

(1..N - 1).to_a.permutation(N - 1) do |l|
  (1..N - 1).to_a.permutation(N - 1) do |r|
    path = []
    left = 0
    right = r[0]

    (N - 1).times do |i|
      path.push([left, right])
      left = l[i]
      path.push([left, right])
      right = r[i + 1]
    end

    path.push([left, 0])

    cnt = 0
    (N * 2 - 1).times do |i|
      (i + 1).upto(N * 2 - 2) do |j|
        cnt += 1 if (path[i][0] - path[j][0]) * (path[i][1] - path[j][1]) < 0
      end
    end
    max_cnt = [max_cnt, cnt].max
  end
end

puts max_cnt
