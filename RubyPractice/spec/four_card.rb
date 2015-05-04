#どんな点を考えたか
#あんまり複雑に考えない
#たぶんコード量はすくないけど、想定漏れが怖そうなのでテストケースは網羅しよう
#実際は漏れとかなかったけどね
#時間に余裕があったからもうちょっと命名をしっかりしてあげても良かったかも
#正規表現を回すのが一番安全かなと思った。ちょっとやぼったい実装なきがするが・・・・

class Card
  def initialize(cards)
    @cards = cards
  end

  def check_role
    return "FourCard" if show_max_character_count == 4
    return "ThreeCard" if show_max_character_count == 3
    return "TwoPair" if show_max_character_count == 2 && count_same_character.count(2) == 2
    return "OnePair" if show_max_character_count == 2
    "NoPair"
  end

  def count_same_character
    ("A".."Z").reduce([]) { |result, char| result.push(@cards.scan(/[#{char}¥*]/).size) }
  end

  def show_max_character_count
    count_same_character.max
  end
end

cards = gets.to_s
card = Card.new(cards)
puts card.check_role