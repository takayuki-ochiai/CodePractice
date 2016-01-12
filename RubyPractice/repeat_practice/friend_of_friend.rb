require 'prime'

primes = Prime.take(6)

min = primes[-1] * primes[-1]
min_friend = []

primes.permutation do |prime|
  friends = prime.each_cons(2).map{ |x, y| x * y }
  # 戦闘と末尾は同じ数の兵法
  friends += [prime[0], prime[-1]].map{ |x| x * x }
  if min > friends.max
    min = friends.max
    min_friend = friends
  end
end

puts min
p min_friend
