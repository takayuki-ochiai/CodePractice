# row = []

# row[0] = "Liverpool"
# row[1] = "15"

# name = row[0]
# wins = row[1].to_i
row = Performance.new
row.name = "Liverpool"
row.wins = "15"

class Performance
  attr_accessor :name

  def initialize
    @data = []
  end

  def wins
    @wins.to_i
  end
end

#気づき あたりまえのことだと思っていた。うーん失敗した！