require 'pry'
class User
  attr_accessor :current_x, :current_y
  attr_accessor :initial_x

  def initialize(initial_x, current_x, current_y)
    @initial_x = initial_x
    @current_x = current_x
    @current_y = current_y
  end

    def move_position(nearest_branch)
      move_x_point, move_y_point = nearest_branch[:to_x], nearest_branch[:to_y]
      @current_x = move_x_point
      @current_y = move_y_point
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
  attr_accessor :vertical_line_nums

  def initialize(vertical_line_nums)
    @horizontal_lines = []
    @vertical_line_nums = vertical_line_nums.to_i
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
    branches = fetch_branches_in_straight_line
    # #分岐情報のなかで進行方向に存在するものを返す
    branches.select! { |branch| branch[:from_y] - current_y > 0 }
    # #分岐情報のなかで現在のy位置との差が最小のものを返す
    branches.min_by{ |branch| branch[:from_y] - current_y }
  end

  def fetch_branches_in_straight_line
    @horizontal_lines.collect do |horizontal_line|
      horizontal_line.match_x(current_x)
    end.compact
  end

  def amida_finished?(current_x, current_y)
    search_nearest_branch(current_x, current_y) == nil
  end
end

#判断役　マップオブジェクトとユーザーの現在位置情報のオブジェクトを持つ
#地図とユーザーオブジェクトを持っている
#ゲームの進行管理を行う、具体的には
#地図とユーザーを使ってゴールに到着したか判定を行う
#ユーザーの移動の指示を行う(地図役がユーザーの現在位置をもとに返された横線情報をもとに、ユーザーに移動の指示を行う)
#ゴールに到着していない場合は再度ユーザーの移動を行う
#到着していたら目標のゴールか判定を行う
#目標のゴールである場合はユーザーに初期位置を返させる
#そうでない場合はユーザーオブジェクトを破棄して新規データを入力して再度実行する
class AmidaController
  attr_accessor :amida_map, :user, :target_goal
  def initialize(amida_map, target_goal)
    @amida_map = amida_map
    @user = User.new(1, 1, 0)
    @target_goal = target_goal
  end

  def amida_finished?
    @amida_map.amida_finished?(@user.current_x, @user.current_y)
  end

  def advance
    return @user.initial_x if amida_finished? && target_goal?
    if amida_finished?
      refresh_game
    else
      nearest_branch = @amida_map.search_nearest_branch(@user.current_x, @user.current_y)
      user.move_position(nearest_branch)
      advance
    end
  end

  def refresh_game
    if @user.initial_x < @amida_map.vertical_line_nums
      @user = User.new(@user.initial_x + 1, @user.initial_x + 1, 0)
      advance
    else
      "ゴールにたどり着きませんでした"
    end
  end

  def target_goal?
    @user.current_x == @target_goal
  end
end


class AmidaInterface
  def initialize(vertical_line_nums)
    @amida_map = AmidaMap.new(vertical_line_nums)
  end

  def add_horizontal_line(horizontal_line)
    @amida_map.add_horizontal_line(horizontal_line)
  end

  def create_amida_controller(target_goal)
    AmidaController.new(@amida_map, target_goal)
  end
end

# input_line = gets.to_s.split(" ")
# vertical_line_nums, horizontal_line_nums = input_line[1], input_line[2].to_i
# amida_interface = AmidaInterface.new(vertical_line_nums)

# horizontal_line_nums.times do |n|
#   input_line = gets.to_s.split(" ")
#   horizontal_line = HorizontalLine.new(input_line[0], input_line[1], input_line[2])
#   amida_interface.add_horizontal_line(horizontal_line)
# end

# amida_controller = amida_interface.create_amida_controller(1)
# puts amida_controller.advance



