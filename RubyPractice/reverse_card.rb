# 裏向きの時はfalse,表向きの時はtrueで表現する

#百枚の裏向きのカードのデータ構造を作る
cards = []
100.times do
  cards << false
end

#n人目がn+1枚目のカードがからn枚おきにカードを裏返す
# 99人になるまで続ける
(1..99).each do |n|
  # n + 1の倍数番目のカードだけ裏返す
  cards.map!.with_index do |card, index|
    if (index + 1) % (n + 1) == 0
      card = !card
    else
      card
    end
  end
end

# 裏向きのカードの番号を全て求める
cards.each_with_index do |card, index|
  puts index + 1 if !card
end


# 模範解答
N = 100
cards = Array.new(N, false)

(2..N).each do |i|
  j = i - 1
  while (j < cards.size)
    cards[j] = !cards[j]
    j += i
  end
end

cards.each_with_index do |card, index|
  puts index + 1 if !card
end
