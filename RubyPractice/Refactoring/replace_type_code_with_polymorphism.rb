#タイプコードからポリモーフィズムへ
#マウンテンバイクのモデリングを例として使う。MoutainBikeのインスタンスは:rigid(suspensionなし), :front_suspension(フロントサスペンションのみあり), :full_suspension(フロントとリアの両方のサスペンション両方あり)のどれかになる

module MoutainBike
  def wheel_circumference
    Math::PI * (@wheel_diameter + @tire_diameter)
  end
end

class RigidMountainBike
  include MountainBike
  def price
    (1 + @commision) * @base_price
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR
  end
end

class FrontSuspensionMountainBike
  include MountainBike
  def price
    (1 + @commision) * @base_price + @front_suspension_price
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR + @front_fork_travel * FRONT_SUSPENSION_FACTOR
  end
end

class FullSuspensionMountainBike
  include MountainBike
  def price
    (1 + @commision) * @base_price + @front_suspension_price + @rear_suspension_price
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR + @front_fork_travel * FRONT_SUSPENSION_FACTOR + @rear_fork_travel * REAR_SUSPENSION_FACTOR
  end
end

#次のように使うことができる
bike = RigidMoutainBike.new(type_code: :rigid, tire_width: 2.5)
bike = FrontSuspensionMoutainBike.new(type_code: :front_suspension, tire_width: 2, front_fork_travel: 3)

#気づき : タイプコードが必要になっているクラスは大体templateやstrategyが必要になってくるはずで、まあ今回は種類の違いなのでtemplateっていう判断はまあ間違いではない。バイクの種類が変更になるってこともないだろうしな。

#このリファクタリングの趣旨は、テンプレートパターンにはまりそうなwhen caseは撲滅しようねってことだと思った。
