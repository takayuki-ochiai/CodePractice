#２つのクラスで行うべき仕事をしている１個の区rすについて新しいクラスを作成して関連フィールド、メソッドを旧クラスから新クラスへ移す


class Person
  attr_reader :name
  attr_accessor :office_area_code, :office_number


  def telephone_number
    '(' + @office_area_code + ')' + @office_number
  end
end

