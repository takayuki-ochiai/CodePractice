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
    character_nums =("A".."Z").reduce([]) { |result, char| result.push(@cards.scan(/[#{char}¥*]/).size) }

    if character_nums.max == 4
      "FourCard"
    elsif character_nums.max == 3
      "ThreeCard"
    elsif character_nums.max == 2 && character_nums.count(2) == 2
      "TwoPair"
    elsif character_nums.max == 2
      "OnePair"
    else
      "NoPair"
    end
  end
end

cards = gets.to_s
card = Card.new(cards)
puts card.check_role