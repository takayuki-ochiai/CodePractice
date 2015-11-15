class Thickets
  attr_reader :size, :rabbits

  def initialize(size, rabbits)
    if size <= rabbits.length
      raise "うさぎの数は必ずしげみの数より少なくなければなりません"
    end

    @size = size
    @rabbits = rabbits
    #うさぎに自分が所属した茂みのクラスをセットする
    rabbits.each { |rabbit| rabbit.thickets = self }
  end

  def movable_position(position)
    # 茂みが円周状になっていることを表現する
    actual_position = (position + 1) % size
    actual_position = size if actual_position == 0

    # 指定した茂みにうさぎがいなければ、指定した座標を移動可能座標として返す。
    # 指定した茂みにうさぎがいた場合、移動可能な座標を発見するまで再帰処理
    if rabbits.none? { |rabbit| rabbit.position == actual_position }
      actual_position
    else
      movable_position(actual_position)
    end
  end

  def move_rabbits
    rabbits.each { |rabbit| rabbit.move }
  end

  def rabbit_positions
    rabbits.each { |rabbit| puts rabbit.position }
  end
end

class Rabbit
  attr_accessor :position, :thickets

  def initialize(position)
    @position = position
  end

  def move
    # 一番近い動ける茂みに移動する
    self.position = thickets.movable_position(position)
  end
end

thicket_num, rabbit_num, jumping_num = gets.to_s.chomp.split(' ').map(&:to_i)

rabbits = []
rabbit_num.times do
  rabbits << Rabbit.new(gets.to_i)
end

thickets = Thickets.new(thicket_num, rabbits)

jumping_num.times do
  thickets.move_rabbits
end

thickets.rabbit_positions
