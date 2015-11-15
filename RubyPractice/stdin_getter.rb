# Stdinは標準入力を受け取って整形するためのクラスです。
class StdinGetter
  # 標準入力を受け取って１つの文字列か数値を返します。
  # === 引数
  #  as_integer: 戻り値を数値とするか true: 戻り値を数値で返す false: 戻り値を文字列で返す
  # === 戻り値
  #  標準入力
  def self.get_input(as_integer = false)
    result = gets.to_s.chomp
    result.to_i if as_integer
  end

  # 標準入力を受け取って指定されたパターンで分割した配列として返します。
  # === 引数
  #  pattern: 標準入力を分割するパターン文字列 なにも入力しなかった場合は半カススペースで分割します
  #  as_integer: 戻り値の配列の中身を数値とするか true: 戻り値を数値で返す false: 戻り値を文字列で返す
  # === 戻り値
  #  標準入力
  def self.get_input_array(pattern = ' ', as_integer = false)
    results = gets.to_s.chomp.split(pattern)
    results.map(&:to_i) if as_integer
  end

  # 標準入力を指定された回数分受け取って、標準入力の値を格納した配列を返します。
  # === 引数
  #  number: 標準入力を受け取る回数
  # === 戻り値
  #  標準入力の配列
  def self.get_inputs(number)
    results = []
    number.times do
      input = gets.to_s.chomp
      results << input
    end
  end

  # 指定された文字列を含む標準入力が入力されるまで、標準入力を受け取り、
  # 受け取った標準入力の内容をすべて含む配列を返します。
  # === 引数
  #  number: 標準入力を受け取る回数
  # === 戻り値
  #  標準入力の配列
  def self.get_inputs_exclude(str, as_integer = false)
    results = []
    loop do
      input = get_input(as_integer)
      break if input.include?(str)
      results < input
    end
  end
end
