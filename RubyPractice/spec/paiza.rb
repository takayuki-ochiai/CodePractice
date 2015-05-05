# 1行目では縦線の長さL、縦線の本数n、横線の本数mがこの順で半角スペース区切りで与えられます。
# 2行目からm+1行目までのi+1行目では、a_i、b_i、c_iがこの順で半角スペース区切りで与えられます。
# 入力される値は全て整数です。入力最終行は改行コードは入りません。
# 文字列は標準入力から渡されます。



# 7 4 5　L(縦線の長さ)=7、n(縦線の本数)=4、m(横線の本数)=5
# 1 3 1  1番目の横線　1番目の縦線の上から3cmの位置から、2番目の縦線の上から1cmの位置に線が引かれる
# 3 2 2  2番目の横線　3番目の縦線の上から2cmの位置から、4番目の縦線の上から2cmの位置に線が引かれる
#
#
#

# 解決指針
# あみだくじゲームクラス
# 横線クラス

# ３クラスを使う
# あみだくじゲームクラスは現在位置（縦の移動距離、現在何番目の縦線にいるか）の管理、変更などゲームの進捗管理全般を担う
# 横線クラスは一つ一つのインスタンスが一本の横線を表し、何番目と何番目のどの部分をつなぐ横線なのかの情報をもっている

# あみだくじクラス
# 縦に進んで一番距離が近い横線を探し出す
# 現在の横座標の情報を書き換える
# 現在の縦座標の位置

# 横線クラス
# 左側と右側の情報、左側の縦軸位置と右側の縦軸位置の情報を保つ

class Amida
  attr_accessor :vertical_position, :horizontal_position
  #horizontal_linesはコレクションなので通常horizontal_positionのゲッタセッタは定義しない。
  def initialize(vertical_position, horizontal_position)
    @vertical_position = vertical_position
    @horizontal_position = horizontal_position
    @horizontal_lines = []
  end

  def attain_goal
    return horizontal_position if no_branch?
    move_position
  end

  def move_position
    if nearest_branch_to_right.left_vertical_position > nearest_branch_to_left.right_vertical_position
      #右側へ行くパターン
      self.horizontal_position = nearest_branch_to_right.right
      self.vertical_position = nearest_branch_to_right.right_vertical_position
    else
      #左側へ行くパターン
      self.horizontal_position = nearest_branch_to_left.left
      self.vertical_position = nearest_branch_to_left.left_vertical_position
    end
    attain_goal
  end

  def no_branch?
    nearest_branch_to_right == nil && nearest_branch_to_left == nil
  end

  def nearest_branch_to_right
    search_branch_to_right.max_by(&:left_vertical_position)
  end

  def nearest_branch_to_left
    search_branch_to_left.max_by(&:right_vertical_position)
  end

  def search_branch_to_right
    horizontal_lines.select do |horizontal_line|
      horizontal_line.left == horizontal_position && horizontal_line.left_vertical_position < horizontal_position
    end
  end

  def search_branch_to_left
    horizontal_lines.select do |horizontal_line|
      horizontal_line.right == horizontal_position && horizontal_line.right_vertical_position < horizontal_position
    end
  end

  def horizontal_lines
    @horizontal_lines.dup
  end

  def add_horizontal_line(horizontal_line)
    @horizontal_lines << horizontal_line
  end
end

class HorizontalLine
  attr_accessor :left, :right, :left_vertical_position, :right_vertical_position

  def initialize(left, left_vertical_position, right_vertical_position)
    @left = left
    @right = left + 1
    @left_vertical_position = left_vertical_position
    @right_vertical_position = right_vertical_position
  end
end
