
@memo = {}
def black_juck(coin, game)
  return 1 if game == 0
  return 0 if coin == 0
  return @memo[[coin, game]] if @memo.has_key?([coin, game])
  cnt = 0
  cnt += black_juck(coin + 1, game - 1)
  cnt += black_juck(coin - 1, game - 1)
  @memo[[coin, game]] = cnt
  cnt
end

puts black_juck(10, 24)
