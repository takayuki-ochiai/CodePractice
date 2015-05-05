#ダーツゲームのクラスが持つべきもの
#初期の矢の高さ、的の中心の高さと的までのx軸の距離をもつ
#角度angle、初速first_speedで距離xだけ進んだときのy座標を算出するメソッド
#命中判定をするメソッド
#命中位置を計算するメソッド
#命中したかどうかと、命中した位置を出力するメソッド

#所感
#テスト走らせた時にいい結果が出てこなくて普通に焦った。
#今回は複雑な演算だったのでテストの答えを作るのがそもそも難しかったのは仕方ないのだけど、それに甘えるべきではなかった。
#calc_coordinatesあたりはミスりそうな雰囲気あったからテスト書いておけばあんなに慌てることもなかったと思う。
#リファクタリングを読んだ成果か、かなり細かくメソッドが分けられていてイメージがしやすい結果になったと思う。

#意識できた点は
# ・ダーツゲームの初期条件とダーツの標的自体の情報をクラスを分けて管理する
# ・細かなメソッドの分割
# ・テストコードをfswatchで継続的に回しながらの開発
# ・マジックナンバーの定数化
# ・状態の問い合わせと結果の出力の分離

#甘かった点は
#単体テストの粒度が大きすぎて、最後のデバッグで手間取った

#1行目には初期値点の高さo_y,矢の初速s,角度θがスペース区切りの数値で入力されます。
class DartsGame
  attr_accessor :first_height, :initial_velocity, :angle, :target
  GRAVITATIONAL_ACCELERATION = (9.8).freeze

  def initialize(first_height, initial_velocity, angle, target)
    @first_height = first_height.to_i
    @initial_velocity = initial_velocity.to_i
    @angle = angle.to_i
    @target = target
  end

  def show_throw_result
    darts_hit? ? "Hit #{calc_hit_position}" : "Miss"
  end

  private
    #ダーツが当たった位置の中心からの距離を少数第2位四捨五入で算出
    def calc_hit_position
      ((calc_coordinates - target.center_height).abs).round(1)
    end

    #矢の軌道から特定の距離を進んだときのy座標を算出する
    def calc_coordinates
      first_height + target.distance * Math.tan(conversion_radian_angle) - GRAVITATIONAL_ACCELERATION * target.distance ** 2 / 2 / initial_velocity ** 2 / Math.cos(conversion_radian_angle) ** 2
    end

    def conversion_radian_angle
      angle * Math::PI / 180.0
    end

    #ダーツが標的にあたったか
    def darts_hit?
      above_target_lower_side? && below_target_upper_side?
    end

    def above_target_lower_side?
      calc_coordinates >= target.lower_side
    end

    def below_target_upper_side?
      calc_coordinates <= target.upper_side
    end
end

#2行目には的までの距離xと高さyと的の大きさがスペース区切りの数値で入力されます。
class DartsTarget
  attr_reader :distance, :size, :center_height
  def initialize(distance, center_height, size)
    @distance = distance.to_i
    @center_height = center_height.to_i
    @size = size.to_i
  end

  def lower_side
    center_height - size * 0.5
  end

  def upper_side
    center_height + size * 0.5
  end
end

#条件入力
input_darts_game_data = gets.to_s.split(" ")

input_darts_target_data = gets.to_s.split(" ")
distance, center_height, size = input_darts_target_data[0], input_darts_target_data[1], input_darts_target_data[2]
target = DartsTarget.new(distance, center_height, size)

first_height, initial_velocity, angle = input_darts_game_data[0], input_darts_game_data[1], input_darts_game_data[2]
dartsgame = DartsGame.new(first_height, initial_velocity, angle, target)

#結果の出力
puts dartsgame.show_throw_result

#テストコード
# describe "ダーツゲーム" do
#   it "Hit 3.3" do
#     target = DartsTarget.new("10", "10", "10")
#     dartsgame = DartsGame.new("10", "10", "10", target)
#     expect(dartsgame.show_throw_result).to eq("Hit 3.3")
#   end

#   it "Hit 3.2" do
#     target = DartsTarget.new("20", "10", "10")
#     dartsgame = DartsGame.new("10", "13", "45", target)
#     expect(dartsgame.show_throw_result).to eq("Hit 3.2")
#   end

#     it "Miss" do
#     target = DartsTarget.new("10", "10", "10")
#     dartsgame = DartsGame.new("10", "15", "45", target)
#     expect(dartsgame.show_throw_result).to eq("Miss")
#   end
# end