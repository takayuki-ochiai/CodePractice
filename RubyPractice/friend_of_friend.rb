require 'prime'
# Prime.prime?(2) # => true

primes = Prime.take(6)
min = primes[-1] * primes[-1]
min_friend = []

primes.permutation do |prime|
  friends = prime.each_cons(2).map { |x, y| x * y }

  # 先頭と末尾は同じ数の平方
  friends += [prime[0], prime[-1]].map { |x| x * x }

  if min > friends.max
    min = friends.max
    min_friend = friends
  end
end

puts min
p min_friend


# FIY Integer#gcdというメソッドで最大公約数を求めることができる
# FIY Integer#lcmというメソッドで最小公倍数を求めることができる
# FIY Integer#gcdlcmというメソッドで最大公約数と最小公倍数の配列を求めることができる
