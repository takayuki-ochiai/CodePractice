# READ + WRITE + TALK == SKILL

expression = "READ+WRITE+TALK==SKILL"
words = expression.split(/[^a-z]+/i)
chars = words.join.split(//).uniq
word_heads = words.map { |word| word[0] }

cnt = 0
(0..9).to_a.permutation(chars.size) do |set|
  # 各単語の先頭文字が0ではないか
  is_head_zero = false
  if set.include?(0)
    is_head_zero = word_heads.include?(chars[set.index(0)])
  end

  unless is_head_zero
    e = expression.tr(chars.join, set.join)
    if eval(e)
      cnt += 1
      puts e
    end
  end
end

puts cnt
