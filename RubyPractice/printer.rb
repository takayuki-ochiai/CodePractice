#高さが同じ部分ごとに結果を算出する
#

#奥行きの回数分１つの高さに対する入力を受け付ける
#横幅ごとにブロックの有無を判定するためのデータ構造を作る


# input1 = "###"
# input2 = "##."
# input3 = "#.."
# inputs = [input1, input2, input3]

# Here your code !
# input1 = "###"
# input2 = "##."
# input3 = "#.."
# inputs = [input1, input2, input3]

class Stage
  attr_reader :tuples
  SPACE_WITH_BLOCK = "#"
  SPACE_WITHOUT_BLOCK = "."
  def initialize(inputs, y)
    # 同じ横幅座標ごとにブロックの情報保持を変える
    # 横幅の数だけブロックの情報を横幅が同じもの同士の構造に置き換える
    @tuples = []
    y.times do |n|
      tuple = inputs.inject("") { |resukt, input| result + input[n] }
      @tuples << tuple
    end
  end

  #同じ高さのブロックごとに横から見たときのブロックの有無を判定
  def indicate_stage
    tuples.inject("") do |result, tuple|
      space = tuple.include?("#") ? SPACE_WITH_BLOCK : SPACE_WITHOUT_BLOCK
      result << space
    end
  end
end

coordinate_params = gets.to_s
# X Y Z #奥行き X, 横幅 Y, 高さ Z
x, y, z = coordinate_params.split(" ").map(&:to_i)

stages = []
z.times do
  inputs = []
  while true
    input = gets.to_s.chomp
    break if input.include?("--")
    inputs << input
  end
  stage = Stage.new(inputs, y)
  stages.unshift(stage)
end

stages.each { |stage| puts stage.indicate_stage }
