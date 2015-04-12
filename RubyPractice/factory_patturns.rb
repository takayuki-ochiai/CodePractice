class Duck
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eat
    puts "アヒル#{name}は食事中です"
  end

  def speak
    puts "アヒル#{name}はガーガー鳴いています"
  end

  def sleep
    puts "アヒル#{name}は静かに眠っています"
  end
end

class Frog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eat
    puts "カエル#{name}は食事中です"
  end

  def speak
    puts "カエル#{name}はゲコゲコ鳴いています"
  end

  def sleep
    puts "カエル#{name}は眠りません。一晩中ゲコゲコ鳴いています"
  end
end

class Pond
  def initialize(number_ducks)
    @ducks = []
    number_ducks.times do |i|
      duck = Duck.new("アヒル#{i}")
      @ducks << duck
    end
  end

  def simulate_one_day
    @ducks.each do |duck|
       duck.eat
       duck.speak
       duck.sleep
    end
  end
end

pond = Pond.new(5)
pond.simulate_one_day