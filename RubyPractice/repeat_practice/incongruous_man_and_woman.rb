men = 20
women = 10

# 0人からスタートするため
men += 1
women += 1

man_and_woman_path = Array.new(men * women, 0)

# 0 - 20
# 21 - 41
# 42 - 62
# 63 - 83
# 84 - 104
# 105 - 125
# 126 - 146
# 147 - 167
# 168 - 188
# 189 - 209
# 210 - 230

man_and_woman_path[0] = 1
men.times do |man|
  women.times do |woman|
    next if man == woman || (men - man == women - woman)
    if man > 0
      man_and_woman_path[man + woman * men] +=
        man_and_woman_path[man - 1 + woman * men]
    end

    if woman > 0
      man_and_woman_path[man + woman * men] +=
        man_and_woman_path[man + men * (woman - 1)]
    end
  end
end

puts man_and_woman_path[-2]
