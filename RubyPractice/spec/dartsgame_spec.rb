require "dartsgame"
describe "ダーツゲーム" do
  it "Hit 3.3" do
    target = DartsTarget.new("10", "10", "10")
    dartsgame = DartsGame.new("10", "10", "10", target)
    expect(dartsgame.show_throw_result).to eq("Hit 3.3")
  end

  it "Hit 3.2" do
    target = DartsTarget.new("20", "10", "10")
    dartsgame = DartsGame.new("10", "13", "45", target)
    expect(dartsgame.show_throw_result).to eq("Hit 3.2")
  end

    it "Miss" do
    target = DartsTarget.new("10", "10", "10")
    dartsgame = DartsGame.new("10", "15", "45", target)
    expect(dartsgame.show_throw_result).to eq("Miss")
  end
end