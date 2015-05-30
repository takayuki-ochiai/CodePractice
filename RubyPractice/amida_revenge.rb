class User
  attr_accessor :current_x, :current_y
  attr_accessor :initial_x

  def initialize(initial_x, current_x, current_y)
    @initial_x = initial_x
    @current_x = current_x
    @current_y = current_y
  end
end

class HorizontalLine
  def initialize(left_side_x, left_side_y, right_side_y)
    @posiiton = {
        left: { x: left_side_x.to_i, y: left_side_y.to_i },
        right: { x: left_side_x.to_i + 1, y: right_side_y.to_i }
      }
  end

  def left_side_x
    @posiiton[:left][:x]
  end

  def right_side_x
    @posiiton[:right][:x]
  end

  def left_side_y
    @posiiton[:left][:y]
  end

  def right_side_x
    @posiiton[:right][:x]
  end
end