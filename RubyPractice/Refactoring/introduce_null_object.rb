class MissingCustomer
  def name
    'occupant'
  end

  def plan=

  end
end

class Customer
  def self.new_missing
    MissingCustomer.new
  end
end

class Site
  def customer
    @customer || Customer.new_missing
  end
end

site = Site.new
customer = site.customer #@customerがない場合はnullオブジェクトが返される
customer.plan = BillingPlan.special #nullオブジェクトはセッタとしてなにも動かない
customer_name = customer.name #nullオブジェクトは'occupant'を返す