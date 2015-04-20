class Computer
  attr_accessor :display, :mother_board
  attr_reader :drivers

  def initialize(display = :crt, mother_board = Motherboard.new, drivers = [] )
    @display = display
    @mother_board = mother_board
    @drivers = drivers
  end
end

class CPU
  #CPU共通のコード
end

class BasicCPU < CPU
  #あまり高速でないCPUに関するたくさんのコード
end

class TurboCPU < CPU
  #以下略
end

class Motherboard
  attr_accessor :cpu, :memory_size

  def initialize(cpu = BasicCPU.new, memory_size = 1000)
    @cpu = cpu
    @memory_size = memory_size
  end
end

class Drive
  attr_reader :type, :size, :writable

  def initialize(type, size, writable)
    @type = type
    @size = size
    @writable = writable
  end
end

#上記のような単純なモデルでもComputerの新しいインスタンスを組み立てるのは面倒くさい
mother_board = Motherboard.new(TurboCPU.new, 4000)

#ハードディスクとCD来たにDVDドライブを追加します

drivers = []
drivers << Drive.new(:hard_drive, 200000, true)
drivers << Drive.new(:cd, 760, true)
drivers << Drive.new(:dvd, 4700, false)

computer = Computer.new(:lcd, mother_board, drivers)

#だいたい上記みたいな感じになる
#この類の複雑なインスタンス構築ロジックをあるクラスにカプセル化するのたBuilderパターン

class ComputerBuilder
  attr_reader :computer

  def initialize
    @computer = Computer.new
  end

  def turbo(has_turbo_cpu = true)
    @computer.motherboard.cpu = TurboCPU.new
  end

  def display=(display)
    @computer.display = display
  end

  def memory_size=(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writer = false)
    @computer.drivers << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer = false)
    @computer.drivers << Drive.new(:dvd, 760, writer)
  end

  def add_hard_disk(size_in_mb)
    @computer.drivers << Drive.new(:hard_disk, size_in_mb, true)
  end
end

#ビルだを使ったComputerインスタンス作成
builder = ComputerBuilder.new
builder.turbo
builder.add_cd(true)
builder.add_dvd
builder.add_hard_disk(100000)

computer = builder.computer
#ビルダオブジェクトのクライアントをディレクタ、作られるオブジェクト(ここでは Computer)は製品と呼ばれる
#煩雑なオブジェクト構成コードを分離することが目的となるのがビルダだが、精製するオブジェクトのクラス選択をする場合にも便利になる

class DesktopComputer < Computer
  #デスクトップの詳細に関するいろんなコード
end

class LaptopComputer < Computer
  def initialize(motherboard = Motherboard.new, drivers = [])
    super(:lcd, motherboard, drivers)
  end

  #ラップトップの詳細にかんするいかりゃく
end

#DesktopBuilderやLaptopBuilderを用意して
class DesktopBuilder < ComputerBuilder
  def initialize
    @computer = DesktopComputer.new
  end

  def add_cd(writer = false)
    @computer.drivers << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer = false)
    @computer.drivers << Drive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    @computer.drivers << Drive.new(:hard_disk, size_in_mb, true)
  end
end

class LaptopBuilder < ComputerBuilder
  def initialize
    @computer = LaptopComputer.new
  end

  def add_cd(writer = false)
    @computer.drivers << LaptopDrive.new(:cd, 760, writer)
  end

  def add_dvd(writer = false)
    @computer.drivers << LaptopDrive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    @computer.drivers << LaptopDrive.new(:hard_disk, size_in_mb, true)
  end
end

#単一のビルドグラスがラップトップとデスクトップの両方を生成でき、パラメーターの値で作り分けるとかもできる
#ビルダでオブジェクトの妥当性を保証することも可能である

#オープンクラスで追加してみた
class ComputerBuilder
  def computer
    raise "Not enough memory" if @computer.motherboard.memory_size < 250
    raise "Too many drivers" if @computer.drivers.size > 4
    hard_disk = @computer.drivers.find{ |drive| drive.type == :hard_disk }
    raise "No hard disk" unless hard_disk
    @computer
  end
end

#単一のビルダで作られるインスタンスを初期化するresetメソッドの追加

class LaptopBuilder
  def reset
    @computer = LaptopComputer.new
  end
end

class DesktopBuilder
  def reset
    @computer = DesktopComputer.new
  end
end