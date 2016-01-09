

def cake(cut_num, square_number, prev, log)
  if cut_num == log.size
    # 終了条件
    if square_number.include?(1 + prev)
      puts cut_num
      p log
      return true
    end
  else
    ((1..cut_num).to_a - log).each do |i|
      # 和が平方数になるような数のイチゴを載せることを繰り返す
      if square_number.include?(prev + i)
        return true if cake(cut_num, square_number, i, log + [i])
      end
    end
  end
  false
end


cut_num = 2
while true
  square_number = (1..cut_num).to_a.map { |i| i * i }
  break if cake(cut_num, square_number, 1, [1])
  cut_num += 1
end
