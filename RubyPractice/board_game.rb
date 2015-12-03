# オセロゲームを作る
require 'pry'
class Othello
  B = 'B'.freeze
  W = 'W'.freeze
  E = ' '.freeze

  RIGHT_UP_SLANT_INIT_CELLS = [
    [1, 1],
    [1, 2],
    [1, 3],
    [1, 4],
    [1, 5],
    [1, 6],
    [1, 7],
    [1, 8],
    [2, 8],
    [3, 8],
    [4, 8],
    [5, 8],
    [6, 8],
    [7, 8],
    [8, 8]
  ]

  LEFT_UP_SLANT_INIT_CELLS = [
    [1, 8],
    [1, 7],
    [1, 6],
    [1, 5],
    [1, 4],
    [1, 3],
    [1, 2],
    [1, 1],
    [2, 1],
    [3, 1],
    [4, 1],
    [5, 1],
    [6, 1],
    [7, 1],
    [8, 1]
  ]

  attr_reader :board

  def initialize
    @board = [
      [E, E, E, E, E, E, E, E],
      [E, E, E, E, E, E, E, E],
      [E, E, E, E, E, E, E, E],
      [E, E, E, W, B, E, E, E],
      [E, E, E, B, W, E, E, E],
      [E, E, E, E, E, E, E, E],
      [E, E, E, E, E, E, E, E],
      [E, E, E, E, E, E, E, E]
    ]
  end

  # 表示用
  def disp
    board.each do |horizon_line|
      print horizon_line
      puts ''
    end
  end

  # 指定した縦軸のデータを取得
  def vertical_line(n)
    board.map { |horizon_line| horizon_line[n - 1] }
  end

  def horizontal_line(n)
    board[n - 1]
  end

  # 右肩上がりの斜めのデータを取得(1 ~ 15)
  # 左上の斜めの列を１とする
  def right_up_slant_line(n)
    init_cell = RIGHT_UP_SLANT_INIT_CELLS[n - 1]
    x, y = init_cell[0] - 1, init_cell[1] - 1
    right_up_slant_line = []
    while (x < 8 && y > -1)
      right_up_slant_line << board[y][x]
      x += 1
      y -= 1
    end
    right_up_slant_line
  end

  # # 左肩上がりの斜めのデータを取得(1 ~ 15)
  # # 左下の斜めの列を１とする
  def left_up_slant_line(n)
    init_cell = LEFT_UP_SLANT_INIT_CELLS[n - 1]
    x, y = init_cell[0] - 1, init_cell[1] - 1
    left_up_slant_line = []
    while (x < 8 && y < 8)
      left_up_slant_line << board[y][x]
      x += 1
      y += 1
    end
    left_up_slant_line
  end

  # 指定したlineでひっくり返せるオセロを探してひっくり返す
  # 設置するオセロの色と設置する場所（1 ~ 8), 縦か横か斜めの列を入力値とする
  def invert(color, number, line)
    # 斜めの列は1 ~ 8個の要素の配列であることに注意
    # 隣が違う色か判定
    # 隅っこ設置の場合はindex boundsも注意
    line[number - 1] = color
    right_neighbor = number + 1
    left_neighbor = number - 1

    # 右隣が色違いのオセロか調べる
    right_side_cells = []
    while right_neighbor < line.length + 1
      # 右側をひっくり返せるか、ひっくり返すとしてどれだけひっくり返すか
      right_side_cells << line[right_neighbor - 1]
      right_neighbor += 1
    end

    right_side_cells = do_invert(right_side_cells, color)

    left_side_cells = []
    # 左隣が色違いのオセロか調べる
    while left_neighbor > 0
      left_side_cells << line[left_neighbor - 1]
      left_neighbor -= 1
    end

    left_side_cells = do_invert(left_side_cells, color)
    left_side_cells.reverse! << color
    results = left_side_cells + right_side_cells
    results
  end

  def do_invert(cells, color)
    # 変換前の列を用意しておく
    before_change_cells = cells.dup
    # 最後のやつが違う色か空白かだけ調べる
    cells.map!.with_index do |cell, i|
      # 空白だったら,あるいはcellsの最後まで行って
      # 最後のcellが同じ色だったらひっくり返せないのでもとの状態に戻して返す
      if cell == E || (cells.length == i + 1 && cell == reverse_color(color))
        cells = before_change_cells
        break
      end
      # 色が違ったらひっくり返す
      next color if cell == reverse_color(color)
      # 同じ色だったらその時点で処理を修了する
      break cells if cell == color
    end
    cells
  end

  def reverse_color(color)
    return W if color == B
    return B if color == W
    nil
  end

  def set_stone(color, x, y)
    x = x.to_i
    y = y.to_i
    # まず横列
    # B 6 5 横６　縦５に黒
    set_horizontal_line(y, invert(color, x, horizontal_line(y)))
    # つぎに縦列
    set_vertival_line(x, invert(color, y, vertical_line(x)))

    # 右肩上がりの斜め列
    n = x + y - 1
    right_slant_number = x - RIGHT_UP_SLANT_INIT_CELLS[n - 1][0] + 1
    converted_right_up_slant = invert(color, right_slant_number, right_up_slant_line(n))
    set_right_up_slant_line(n, converted_right_up_slant)

    # 左肩上がりの斜め列
    m = x - y + 8
    left_up_slant_line(m)
    left_slant_number = x - LEFT_UP_SLANT_INIT_CELLS[m - 1][0] + 1
    converted_left_up_result = invert(color, left_slant_number, left_up_slant_line(m))
    set_left_up_slant_line(m, converted_left_up_result)
  end

  def set_horizontal_line(n, convert_line)
    board[n - 1] = convert_line
  end

  def set_vertival_line(n, convert_line)
    board.each_with_index do |horizon_line, i|
      # n列目のデータを書き換える
      horizon_line[n - 1] = convert_line[i]
    end
  end

  def set_right_up_slant_line(n, convert_line)
    init_cell = RIGHT_UP_SLANT_INIT_CELLS[n - 1]
    x, y = init_cell[0] - 1, init_cell[1] - 1
    i = 0
    while (x < 8 && y > -1)
      board[y][x] = convert_line[i]
      x += 1
      y -= 1
      i += 1
    end
  end

  def set_left_up_slant_line(n, convert_line)
    init_cell = LEFT_UP_SLANT_INIT_CELLS[n - 1]
    x, y = init_cell[0] - 1, init_cell[1] - 1
    i = 0
    while (x < 8 && y < 8)
      board[y][x] = convert_line[i]
      x += 1
      y += 1
      i += 1
    end
  end

  def show_result
    black_num = board.inject(0) do |sum, horizontal_line|
      sum += horizontal_line.count(B)
    end

    white_num = board.inject(0) do |sum, horizontal_line|
      sum += horizontal_line.count(W)
    end

    black_num = "0" + black_num.to_s if black_num < 10
    white_num = "0" + white_num.to_s if white_num < 10
    if white_num.to_i == black_num.to_i
      description = "Draw!"
    elsif black_num.to_i > white_num.to_i
      description = "The black won!"
    else
      description = "The white won!"
    end

    puts "#{black_num}-#{white_num} #{description}"
  end
end

othello = Othello.new
# othello.vertical_line(4)
# print othello.vertical_line(4)

# othello.set_stone('B', '6', '5')
input_number = gets.to_i

input_number.times do
  color, x, y = gets.to_s.chomp.split(' ')
  othello.set_stone(color, x, y)
end
othello.show_result

inputs = [
"B 6 5",
"W 4 6",
"B 3 4",
"W 4 3",
"B 3 5",
"W 6 6",
"B 5 6",
"W 2 6",
"B 2 5",
"W 1 6",
"B 2 4",
"W 7 6",
"B 7 5",
"W 6 4",
"B 5 3",
"W 6 3",
"B 6 2",
"W 4 2",
"B 3 2",
"W 2 3",
"B 3 6"
]

inputs.each do |input|
  color, x, y = input.split(' ')
  othello.set_stone(color, x, y)
end

othello.disp
othello.show_result
