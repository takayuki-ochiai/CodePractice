class Account
  def overdraft_charge
    @account_type.overdraft_charge(@days_overdawn)
  end

  def bank_charge
    result = 4.5
    if @days_overdawn > 0
      result += @account_type.overdraft_charge(@days_overdawn)
    end
    result
  end
end

class AccountType
  def overdraft_charge(days_overdawn)
    if premium?
      result = 10
      result += (days_overdawn - 7) * 0.85 if days_overdawn > 7
      result
    else
      days_overdawn * 1.75
    end
  end
end

#気づき：　今回の事例だとあまり効果がイメージできないが、今後新しい口座の種類がいくつか作られる時、貸し越し料金の計算方法がそれぞれ異なるといったことを想定しているらしい。本質的な理解としては