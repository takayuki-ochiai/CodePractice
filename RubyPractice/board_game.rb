# オセロゲームを作る
require 'pry'
class Othello
  B = 'B'.freeze
  W = 'W'.freeze
  E = ''.freeze

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
  #
  # # 指定したlineでひっくり返せるオセロを探してひっくり返す
  # def invert
  #
  # end
end

othello = Othello.new
othello.vertical_line(4)
print othello.right_up_slant_line(15)
print othello.left_up_slant_line(8)
