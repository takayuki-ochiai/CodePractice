#タイプコードからポリモーフィズムへ
#マウンテンバイクのモデリングを例として使う。MoutainBikeのインスタンスは:rigid(suspensionなし), :front_suspension(フロントサスペンションのみあり), :full_suspension(フロントとリアの両方のサスペンション両方あり)のどれかになる

class MoutainBike
  def initialize(params)
    params.each { |key, value| instance_variable_set "@#{key}", value }
  end

  def off_road_ability
    result = @tire_width * TIRE_WIDTH_FACTOR
    if @type_code == :front_suspension || @type_code == :full_suspension
      result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
    end
    if @type_code == :full_suspension
      result += @rear_fork_travel * REAR_SUSPENSION_FACTOR
    end
    result
  end

  #p.250
  def price
    case @type_code
      when :rigid
        (1 + @commision) * @base_price
      when :front_suspension
        (1 + @commision) * @base_price + @front_suspension_price
      when :full_suspension
        (1 + @commision) * @base_price + @front_suspension_price + @rear_suspension_price
    end
  end
end

#次のように使うことができる
bike = MoutainBike.new(type_code: :rigid, tire_width: 2.5)
bike = MoutainBike.new(type_code: :front_suspension, tire_width: 2, front_fork_travel: 3)
