require 'pry'

# 光クラスを作成する
# 光クラスは進行方向を示すキーを持つ変数と
# 現在位置を示す変数２つと
# 区画通過回数１つを持つ

# 光クラスを作成する
# 光クラスは進行方向を示すキーを持つ変数と
# 現在位置を示す変数２つと
# 区画通過回数１つを持つ

class Light
  attr_accessor :current_x, :current_y, :direction, :stay_count

  def initialize
    @current_x = 1
    @current_y = 1
    @direction = :right
    @stay_count = 1
  end

  def change_direction(mirror)
    return if mirror == '_'
    return @direction = :down if reflect_down?(mirror)
    return @direction = :left if reflect_left?(mirror)
    return @direction = :up if reflect_up?(mirror)
    return @direction = :right if reflect_right?(mirror)

  end

  def reflect_down?(mirror)
    (mirror == '\\' && @direction == :right) || (mirror == '/' && @direction == :left)
  end

  def reflect_up?(mirror)
    (mirror == '\\' && @direction == :left) || (mirror == '/' && @direction == :right)
  end

  def reflect_right?(mirror)
    (mirror == '\\' && @direction == :down) || (mirror == '/' && @direction == :up)
  end

  def reflect_left?(mirror)
    (mirror == '\\' && @direction == :up) || (mirror == '/' && @direction == :down)
  end

  #たぶん光でやらないほうがいい仕事だと思う
  def move_light(box)
    box_cell = box.current_box_cell(@current_x, @current_y)
    change_direction(box_cell[0].mirror)
    change_position
    return  @stay_count if out_of_box?(box)
    @stay_count += 1
    #move_lightを再帰呼び出しする
    move_light(box)
  end

  def out_of_box?(box)
    @current_x < 1 || @current_x > box.width || @current_y < 1 || @current_y > box.height
  end

  def change_position
    @current_x += 1 if @direction == :right
    @current_x -= 1 if @direction == :left
    @current_y += 1 if @direction == :down
    @current_y -= 1 if @direction == :up
  end
end

class BoxCell
  attr_reader :x, :y, :mirror
  #mirrorは"_", "/", "\"で表現する
  def initialize(x, y, mirror)
    @x = x
    @y = y
    @mirror = mirror
  end
end

class Box
  attr_reader :width, :height, :box_cells

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
    @box_cells = []
  end

  def box_cells
    @box_cells.dup
  end

  def add_box_cell(box_cell)
    @box_cells.push(box_cell)
  end

  def current_box_cell(current_x, current_y)
    @box_cells.select { |box_cell| box_cell.x == current_x && box_cell.y == current_y }
  end
end

input_line = gets.to_s.split(" ")
height, width = input_line[0], input_line[1]
box = Box.new(width, height)

height.to_i.times do |y|
  input_lines = gets.to_s.split("")
  input_lines.each_with_index do |input_line, index|
    box_cell = BoxCell.new(index + 1, y + 1, input_line)
    box.add_box_cell(box_cell)
  end
end

light = Light.new
puts light.move_light(box)

