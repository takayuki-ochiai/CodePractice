require "date"
# 1964-10-10
(Date.parse('1964-10-10')..Date.parse('2020-07-24')).each do |date|
  int = date.strftime('%Y%m%d').to_i
  converted_int = int.to_s(2).reverse
  puts date.strftime('%Y-%m-%d') if converted_int == int.to_s(2)
end


# ポイント：日付の範囲リテラルに気付けるか 日付変換できるか
# puts 19660713.to_s(2)
# puts 19660713.to_s(2).reverse
