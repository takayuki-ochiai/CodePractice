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

class Algae
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def grow
    puts "藻#{name}は光をあびてすくすく育ちます"
  end
end

class WaterLily
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def grow
    puts "睡蓮#{name}は水に浮かびながら光をあびて育ちます"
  end
end



class Pond
  def initialize(number_animals, number_plants)
    @animals = []
    number_animals.times do |i|
      animal = new_animal("動物#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_plant("植物#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @animals.each do |animal|
       animal.eat
       animal.speak
       animal.sleep
    end

    @plants.each do |plant|
        plant.grow
    end
  end
end

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end

class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

class FrogAlgaePond < Pond
  def new_animal(name)
    Frog.new(name)
  end

  def new_plant(name)
    Algae.new(name)
  end
end

pond = FrogAlgaePond.new(4, 3)
pond.simulate_one_day
