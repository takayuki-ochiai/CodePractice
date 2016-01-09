length = 500

def square(length)
  answer = []
  (1..length / 4).each do |n|
    square_area = n * n

    areas = (1..(n - 1)).to_a.map do |i|
      (n * 2 - i) * i
    end

    areas.repeated_combination(2) do |a, b|
      if a + b == square_area
        answer << [1, b / a.to_f, square_area / a.to_f]
      end
    end
  end
  answer.uniq!
  answer.size
end

puts square(length)

# 紐の長さ20のとき
# 1,9
# 2,8
# 3,7
# 4,6

# 紐の長さ24のとき
# 1,11
# 2,10
# 3,9
# 4,8
# 5,7
