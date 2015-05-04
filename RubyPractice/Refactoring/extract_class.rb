#２つのクラスで行うべき仕事をしている１個の区rすについて新しいクラスを作成して関連フィールド、メソッドを旧クラスから新クラスへ移す


class Person
  attr_reader :name

  def initialize
    @office_telephone = TelephoneNumber.new
  end

  def telephone_number
    '(' + @office_telephone.area_code + ')' + @office_number
  end

  def office_area_code
    @office_telephone.area_code
  end

  def office_area_code=(arg)
    @office_telephone.area_code = arg
  end
end

class TelephoneNumber
  attr_accessor :area_code, :number
end