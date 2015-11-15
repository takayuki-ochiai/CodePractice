# １フレームを一つのインスタンスとする
# ゲーム全体を１つのコントローラーとする
# １フレームは１〜３回の投球結果を持つ
# 1フレームは最終フレーム以外３つの状態を持っています(none, strike, spare)
# 1フレームが役なしのとき、１フレームのポイントを自分の投球結果から算出します
# 1フレームがスペアのとき、つぎのフレームの最初の投球結果を取得して自分の投球結果と合わせて算出します
# １フレームがストライクのとき、つぎのフレームがspareかnoneならつぎのフレームの得点を今回の投球結果と合わせて算出します
# 1フレームがストライクのとき、つぎのフレームがストライクならこのフレームの得点とつぎのフームの最初の投球結果を取得してポイントとします
class Frame
  NONE   = 'none'.freeze
  SPARE  = 'spare'.freeze
  STRIKE = 'strike'.freeze

  GARTER       = 'G'.freeze
  GARTER_SCORE = 0

  attr_reader :throw_results, :pin_num
  attr_accessor :next_frame

  def initialize(pin_num, stdin_throw_results)
    @throw_results = []
    @pin_num = pin_num
    @next_frame = NilFrame.new
    input_throw_results(stdin_throw_results)
  end

  # １つ前のフレームの結果を受け取って、加算するべきポイントを返します
  def additional_score(result)
    if result == SPARE
      throw_results.first
    elsif result == STRIKE
      # 自分の結果がストライクならつぎのフレームの最初の投球結果も合わせた結果を返す
      # そうでないなら最初から２投目までの結果を返す
      if own_result == STRIKE
        prime_score + next_frame.additional_score(SPARE)
      else
        # 最終フレームは3投する可能性もあるので
        throw_results[0] + throw_results[1]
      end
    end
  end

  def points
    if own_result == STRIKE || own_result == SPARE
      prime_score + next_frame.additional_score(own_result)
    else
      prime_score
    end
  end

  # 基礎点を返します
  def prime_score
    throw_results.inject(0) do |prime_score, throw_result|
      prime_score + throw_result
    end
  end

  # このフレームの役の結果を返します。(役なしかスペアかストライク)
  # pin_num ゲームで設定された１フレームのピン数(数値クラス)
  def own_result
    # ガーター考慮
    return STRIKE if throw_results.first.to_i == pin_num
    return SPARE if prime_score == pin_num
    NONE
  end

  def input_throw_results(stdin_throw_results)
    # TODO: 余裕があったらpin_numを超えたときの例外処理を挟む
    convert_result(stdin_throw_results)

    # 第1投ですべてのピンが倒れていない場合、つぎの投球を受け取る
    unless throw_results.first == pin_num
      convert_result(stdin_throw_results)
    end
  end

  def convert_result(stdin_throw_results)
    throw_result = stdin_throw_results.shift
    throw_result = GARTER_SCORE if throw_result == GARTER
    throw_results << throw_result.to_i
  end
end

# FrameのNilクラスです。このフレームはどんなときも追加点０を返します。
class NilFrame
  def additional_score(_result)
    0
  end
end

# 最終フレーム用のクラスです.
class LastFrame < Frame
  def input_throw_results(stdin_throw_results)
    convert_result(stdin_throw_results)

    # 1投目STRIKEの場合
    if throw_results.first == pin_num
      convert_result(stdin_throw_results)
      convert_result(stdin_throw_results)
    else
      convert_result(stdin_throw_results)
      # 2投目で全部倒した場合、3投目の得点を２倍して加算
      convert_result(stdin_throw_results) if prime_score == pin_num
    end
  end

  def points
    result = prime_score
    if throw_results[0] + throw_results[1] == pin_num * 2
      return result + throw_results[1] + throw_results[2] * 2
    end

    if throw_results.first == pin_num
      return result + throw_results[1] + throw_results[2]
    end

    if throw_results[0] + throw_results[1] == pin_num
      return result + throw_results[2]
    end

    result
  end
end

# stdin_throw_results = '3 4 G 1 8 2 6 2 10 2 7 G 10 10 10 9 1 3'.split(' ')
# frame_num, pin_num, throw_num = 10, 10, 18
frames = []
# frame_num, pin_num, throw_num = 15, 5, 24
# stdin_throw_results = '5 5 5 4 G 1 G 5 3 2 1 4 4 G G 1 5 5 5 2 1 5 3 1'.split(' ')
frame_num, pin_num, throw_num = gets.to_s.chomp.split(' ').map(&:to_i)
stdin_throw_results = gets.to_s.split(' ')

frame_num.times do |n|
  if n == frame_num - 1
    # 最終フレーム
    frame = LastFrame.new(pin_num, stdin_throw_results)
    # frame = Frame.new(pin_num, stdin_throw_results)
  else
    frame = Frame.new(pin_num, stdin_throw_results)
  end

  frames.last.next_frame = frame if frames.last
  frames << frame
end

puts frames.inject(0) { |a, e| a + e.points }
