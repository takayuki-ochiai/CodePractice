require "../amida_revenge"
describe "あみだくじ" do
    it "HorizontlLine" do
      line = HorizontalLine.new("1", "2", "5")
      expect(line.left_side_x).to eq(1)
      expect(line.right_side_x).to eq(2)
      expect(line.left_side_y).to eq(2)
      expect(line.right_side_y).to eq(5)
    end

    it "AmidaMap" do
      lines = [ HorizontalLine.new("1", "2", "2"), HorizontalLine.new("1", "3", "3"), line3 = HorizontalLine.new("2", "4", "4") ]
      amida_map = AmidaMap.new

      lines.each do |line|
        amida_map.add_horizontal_line(line)
      end

      expect(amida_map.search_nearest_branch(1, 0)).to eq({from_y: 1, to_x: 2, to_y: 2 })
    end
end