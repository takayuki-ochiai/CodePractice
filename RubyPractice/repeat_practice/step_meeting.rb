
@memo = {}
def step(rest_step, max_step)
  return 1 if rest_step == 0
  return 0 if rest_step < 0
  cnt = 0
  (1..max_step).to_a.repeated_permutation(2) do |a, b|
    if @memo.has_key?(rest_step - a - b)
      cnt += @memo[rest_step - a - b]
    else
      tmp = step(rest_step - a - b, max_step)
      cnt += tmp
      @memo[rest_step - a - b] = tmp
    end
  end
  cnt
end

puts step(10, 4)
