# def failure
#   self.state = :failure
# end

# def error
#   self.state = :error
# end

# def success
#   self.state = :success
# end

%i(failure error success).each do |method_name|
  define_method method_name do
    self.state = method_name
  end
end

#こんなメソッドを定義する方法もある
class Class
  def def_each(*method_names, &block)
    method_names.each do |method_name|
      define_method method_name do
        instance_exec method_name, &block
      end
    end
  end
end

#気づき：　たしかに重複は無くなるけど、オープンクラスしてたり考えることが増えるのであまり好みの書き方じゃない。
#クラスマクロを作る方が好きだなあ

class Post
  def self.states(*args)
    args.each do |arg|
      define_method arg do
        self.state = arg
      end
    end
  end

  states :failure, :error, :success
end