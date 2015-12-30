

def palindrome?(str)
  # 文字列長が偶数の場合
  if str.length % 2 == 0
    first_half = str[0, str.length / 2]
    last_half = str[(str.length / 2), str.length / 2]
  else
    # 文字列長が奇数の場合
    first_half = str[0, str.length / 2]
    last_half = str[(str.length / 2) + 1, str.length / 2]
  end
  first_half == last_half.reverse
end

#与えられた10進数が１０進数でも２進数でも８進数でも回文数か判定する
def perfect_palindrome?(num)
  binary = num.to_s(2)
  octal = num.to_s(8)
  palindrome?(num.to_s) && palindrome?(binary) && palindrome?(octal)
end

num = 10
while !perfect_palindrome?(num)
  num += 1
end

puts num


# 模範解答
# よく考えるとただreverseすりゃよかった

num = 11
while true
  if num.to_s == num.to_s.reverse &&
     num.to_s(2) == num.to_s(2).reverse &&
     num.to_s(8) == num.to_s(8).reverse
    puts num
    break
  end
  num += 2
end
