require'pry'
countries = ["Brazil", "Croatia", "Mexico", "Cameroon", "Spain", "Netherlands",
             "Chile", "Australia", "Colombia", "Greece", "Cote d'lvoire", "Japan",
             "Uruguay", "Costa Rica", "England", "Italy", "Switzerland", "Ecuador",
             "France", "Honduras", "Argentina", "Bosnia and Herzegovina", "Iran", "Nigeria",
             "Germany", "Portugal", "Ghana", "USA", "Belgium", "Algeria", "Russia", "Korea Republic"]

# countries.map!(&:upcase)
#
# # 次の始まりの語彙
# # 残りの語彙の配列が返ってくる
# def count_country(char, words)
#   selectable_words = words.select { |word| word[0] == char }
#   return words if selectable_words.empty?
#   # 一番残りの単語数が少なくなる（一番しりとりが長く続く）パターンを探す
#   min_words = words
#   select_word = ''
#   selectable_words.each do |selectable_word|
#     new_words = words.clone
#     new_words.delete(selectable_word)
#     result_words = count_country(selectable_word[-1], new_words)
#     min_words = result_words if min_words.size > result_words.size
#   end
#   min_words
# end
#
# # puts count_country("B", countries)
#
# min_words = countries
# countries.each do |country|
#   new_countries = countries.clone
#   new_countries.delete(country)
#   words = count_country(country[-1], new_countries)
#   puts "#{country} 残った単語数#{words.size}"
#   min_words = words if min_words.size > words.size
# end
#
# puts countries.size - min_words.size
# print countries - min_words

# 模範解答
def search(countries, prev, depth)
  next_country = countries.select { |c| c[0] == prev[-1].upcase }
  if next_country.size > 0
    next_country.each do |c|
      search(countries - [c], c, depth + 1)
    end
  else
    # 続く国がない場合、深さが最大かどうかチェック
    @max_depth = [@max_depth, depth].max
  end
end

@max_depth = 0
countries.each do |c|
  search(countries - [c], c, 1)
end

puts @max_depth
