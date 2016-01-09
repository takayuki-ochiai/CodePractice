require'pry'
countries = ["Brazil", "Croatia", "Mexico", "Cameroon", "Spain", "Netherlands",
             "Chile", "Australia", "Colombia", "Greece", "Cote d'lvoire", "Japan",
             "Uruguay", "Costa Rica", "England", "Italy", "Switzerland", "Ecuador",
             "France", "Honduras", "Argentina", "Bosnia and Herzegovina", "Iran", "Nigeria",
             "Germany", "Portugal", "Ghana", "USA", "Belgium", "Algeria", "Russia", "Korea Republic"]

def select_country(rest_countries, prev, log)
  selectable_countries = rest_countries.select { |country| prev[-1].upcase == country[0] }
  min_countries = rest_countries
  selectable_countries.each do |country|
    countries = select_country(rest_countries - [country], country, log)
    min_countries = countries if min_countries.size > countries.size
  end
  min_countries
end

result = countries
countries.each do |country|
  rest_countries = select_country(countries - [country], country, [])
  puts "#{country} 残った単語数#{rest_countries.size}"
  result = rest_countries if rest_countries.size < result.size
end
print countries - result
