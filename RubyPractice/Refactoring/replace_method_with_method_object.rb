class Gamma
  attr_reader :amount,
                       :input_val,
                       :quantity,
                       :year_to_date,
                       :important_value1,
                       :important_value2,
                       :important_value3

  def initialize(account, input_val_arg, quantity_arg, year_to_date_arg)
    @account = account
    @input_val = input_val_arg
    @quantity = quantity_arg
    @year_to_date = year_to_date_arg
  end

  def compute
    @important_value1 = (input_val * quantity) + @account.delta
    @important_value2 = (input_val * quantity) + 100
    if (year_to_date - important_value1) > 100
      @important_value2 -= 20
    end
    @important_value3 = important_value2 * 7
    #などなど
    @important_value3 - 2 * important_value1
  end
end

class Account
  def gamma(input_val, quantity, year_to_date)
    Gamma.new(self, input_val, quantity, year_to_date).compute
    # important_value1 = (input_val + quantity) + delta
    # important_value2 = (input_val + quantity) + 100
    # if (year_to_date - important_value1) > 100
    #   important_value2 -= 20
    # end
    # important_value3 = important_value2 * 7
    # important_value3 - 2 * important_value1
  end
end



#気づき: すべての変数をまとめて一時変数からインスタンス変数に変えてしまうことで、
#引数渡しの心配をせずにメソッドに対して簡単にメソッドの抽出、問い合わせクエリへをかけられるようになるのがたしかに便利。
#当然その後にメソッドの抽出とか問い合わせクエリへとかの手法と組み合わせる前提となる。
#でも結構使う場所は選びそう。現場によっては変なクラスつくんなとか怒られそう
#古いメソッドはメソッドオブジェクトに処理を委譲するように置き換える

