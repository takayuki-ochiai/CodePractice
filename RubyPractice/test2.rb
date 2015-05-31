 require "pry"
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
  attr_reader :position

  def initialize(left_side_x, left_side_y, right_side_y)
    @position = {
        left: { x: left_side_x.to_i, y: left_side_y.to_i },
        right: { x: left_side_x.to_i + 1, y: right_side_y.to_i }
      }
  end

  def left_side_x
    @position[:left][:x]
  end

  def right_side_x
    @position[:right][:x]
  end

  def left_side_y
    @position[:left][:y]
  end

  def right_side_y
    @position[:right][:y]
  end

  #左端か右端がゲーム中のxの位置と一致するかどうかを判定してハッシュで分岐のy軸の位置と、移動先のx,y座標を返す
  def match_x(current_x)
    if current_x == left_side_x
      return {from_y: left_side_y, to_x: right_side_x, to_y: right_side_y }
    end

    if current_x == right_side_x
      return {from_y: right_side_y, to_x: left_side_x, to_y: left_side_y }
    end
  end
end

#あみだくじの地図役
#あみだくじの地図情報を持つ
#制御役に情報を提供する責務を行う
#地図役は複数の横線クラスによって構成されるコンポジットとして扱う
#横線クラスのコレクションからx軸が一致している横線クラスを選び出し、その中でもxよりも大きくなおかつ差が最も近いyを持つ横線から得た情報を返す
#コレクションの数を数えて返す
class AmidaMap
  def initialize
    @horizontal_lines = []
  end

  def add_horizontal_line(horizontal_line)
    @horizontal_lines.push(horizontal_line)
  end

  def horizontal_lines
    @horizontal_lines.dup
  end

  #位置移動に使うhorizontalLIneから移動用の情報を取ってくる
  #{from_y: integer, to_x: integer, to_y: integer }な形で返ってくる
  def search_nearest_branch(current_x, current_y)
    #現在位置の縦線上にあるすべての分岐情報を取ってくる
    branches = @horizontal_lines.collect do |horizontal_line|
      horizontal_line.match_x(current_x)
    end.compact


    # #分岐情報のなかで進行方向に存在するものを返す
    branches.select! do |branch|
      branch[:from_y] - current_y > 0
    end
    # #分岐情報のなかで現在のy位置との差が最小のものを返す
    branches.min_by{ |branch| branch[:from_y] - current_y }
  end
end

lines = [ HorizontalLine.new("1", "2", "2"), HorizontalLine.new("1", "3", "3"),HorizontalLine.new("2", "4", "4") ]
amida_map = AmidaMap.new()

lines.each do |line|
    amida_map.add_horizontal_line(line)
end
puts amida_map.horizontal_lines
puts amida_map.search_nearest_branch(1,0)