

class PlayerPosition
  attr_reader :width, :height
  attr_accessor :x, :y

  def initialize(width, height, x, y)
    @width = width
    @height = height
    @x = x.to_i
    @y = y.to_i
  end

  def show
    "#{x} #{y}"
  end

  def change_position(direction, distance)
    case direction
    #縦軸移動用
    when "U"
      self.y = y + distance
      self.y = y % height
    when "D"
      if (y - distance) < 0
        self.y = (y - distance) % height
      else
        self.y -= distance
      end
    #横軸移動用
    when "R"
      self.x += distance
      self.x = x % width
    when "L"
      if (self.x - distance) < 0
        self.x = (x - distance) % width
      else
        self.x = x - distance
      end
    end
  end
end



input_settings = gets.to_s.split(" ")
width = input_settings[0].to_i
height = input_settings[1].to_i
log_num = input_settings[2].to_i

input_first_position = gets.to_s.split(" ")
x = input_first_position[0].to_i
y = input_first_position[1].to_i

player_position = PlayerPosition.new(width, height, x, y)

log_num.times do
  command = gets.to_s.split(" ")
  direction = command[0]
  distance = command[1].to_i
  player_position.change_position(direction, distance)
end

puts player_position.show
