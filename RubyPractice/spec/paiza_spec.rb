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
      lines = [ HorizontalLine.new("1", "2", "2"), HorizontalLine.new("1", "3", "3"), HorizontalLine.new("2", "4", "4") ,HorizontalLine.new("3", "2", "3")]
      amida_map = AmidaMap.new(2)

      lines.each do |line|
        amida_map.add_horizontal_line(line)
      end

      expect(amida_map.search_nearest_branch(1, 0)).to eq({from_y: 2, to_x: 2, to_y: 2 })
      expect(amida_map.search_nearest_branch(2, 3)).to eq({from_y: 4, to_x: 3, to_y: 4 })
      expect(amida_map.search_nearest_branch(3, 0)).to eq({from_y: 2, to_x: 4, to_y: 3 })
      expect(amida_map.search_nearest_branch(3, 5)).to eq(nil)
    end

    it "あみだくじ動作確認" do
      amida_interface = AmidaInterface.new("4")
      horizontal_line = HorizontalLine.new("1", "3", "1")
      amida_interface.add_horizontal_line(horizontal_line)
      horizontal_line = HorizontalLine.new("3", "2", "2")
      amida_interface.add_horizontal_line(horizontal_line)
      horizontal_line = HorizontalLine.new("2", "3", "5")
      amida_interface.add_horizontal_line(horizontal_line)
      horizontal_line = HorizontalLine.new("3", "4", "4")
      amida_interface.add_horizontal_line(horizontal_line)
      horizontal_line = HorizontalLine.new("1", "6", "6")
      amida_interface.add_horizontal_line(horizontal_line)
      amida_controller = amida_interface.create_amida_controller(1)
      expect(amida_controller.advance).to eq(3)
    end
end