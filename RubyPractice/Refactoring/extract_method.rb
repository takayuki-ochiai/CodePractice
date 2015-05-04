def print_owing
  outstanding = 0.0
  print_bannner
  outstanding = calculate_outstanding(outstanding)
  print_details outstanding
end

def calculate_outstanding(initial_value)
  @order.inject(initial_value) { |result, order| result + order.amount }
end

def print_details(outstanding)
  puts "name:  #{@name}"
  puts "amount: #{@amount}"
end

#気づき：  かなーりメソッド抽出する粒度が低いし、繰り返しもない前提で抽出している。
#ポイントは一つのメソッドの粒度と、メソッドを構成する処理の意味ごとの分類だと思う。

