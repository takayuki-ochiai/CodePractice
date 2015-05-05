require "paiza"
describe "あみだくじ" do
  it "" do
    amida = Amida.new(7, 1)
    amida.add_horizontal_line(HorizontalLine.new(1, 3, 1))
    amida.add_horizontal_line(HorizontalLine.new(3, 2, 2))
    amida.add_horizontal_line(HorizontalLine.new(2, 3, 5))
    amida.add_horizontal_line(HorizontalLine.new(3, 4, 4))
    amida.add_horizontal_line(HorizontalLine.new(1, 6, 6))
    answer = 0
    4.times do |n|
      amida.horizontal_position = n + 1
      if amida.attain_goal == 1
        answer = n + 1
        break
      end
    end
    expect(answer).to eq(3)
  end
end