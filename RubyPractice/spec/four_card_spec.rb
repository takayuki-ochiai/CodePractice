require "four_card"
describe "paizaプログラミング問題テスト用" do

  it " FourCard" do
    card = Card.new("AAAA")
    expect(card.check_role).to eq("FourCard")
  end

  it " FourCard2" do
    card = Card.new("BBB*")
    expect(card.check_role).to eq("FourCard")
  end

    it " ThreeCard" do
      card = Card.new("CCCA")
      expect(card.check_role).to eq("ThreeCard")
    end

    it " ThreeCard" do
      card = Card.new("C*CA")
      expect(card.check_role).to eq("ThreeCard")
    end

    it " TwoPair" do
      card = Card.new("DDZZ")
      expect(card.check_role).to eq("TwoPair")
    end

    it " OnePair" do
      card = Card.new("ABIA")
      expect(card.check_role).to eq("OnePair")
    end

    it " OnePair2" do
      card = Card.new("D*AZ")
      expect(card.check_role).to eq("OnePair")
    end

    it " NoPair" do
      card = Card.new("OPQE")
      expect(card.check_role).to eq("NoPair")
    end
end