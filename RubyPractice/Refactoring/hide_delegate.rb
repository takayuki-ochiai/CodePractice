# class Person
#   attr_accessor :department
# end

# class Department
#   attr_reader :manager

#   def initialize(manager)
#     @manager = manager
#   end
# end


#委譲を隠蔽するためのメソッドを作成することで密結合を取り除く。
# class Person
#   attr_accessor :department

#   def manager
#     @department.manager
#   end
# end

# class Department
#   attr_reader :manager

#   def initialize(manager)
#     @manager = manager
#   end
# end

class Person
  extend Forwardable
  attr_accessor :department

  def_delegator :@department, :manager
end

class Department
  attr_reader :manager

  def initialize(manager)
    @manager = manager
  end
end

#気づき: 委譲の隠蔽はあまりメリットがよくわからない。
# でも委譲を使いやすくするのはいいな
#extend forwardableでforwardableをクラスに入れられるのはすげえと思った

