reg = /\b(\d{3})(\d{3})(\d{4})\b/


puts "1234567890".gsub(reg) {"(#{$1}) #{$2}-#{$3}"} # (123) 456-7890
puts "1234567890".gsub(reg, "(#{$1}) #{$2}-#{$3}") # (123) 456-7890
puts "1234567890".gsub(reg, "(\\1) \\2-\\3") # (123) 456-7890

# 置換テキストへのマッチコンテキストの挿入
reg = /Match/
puts "BeforeMatchAfter".sub(reg,"\\`\\`\\&\\'\\'") #BeforeBeforeBeforeMatchAfterAfterAfter
puts "BeforeMatchAfter".sub(reg) { "#{$`}#{$`}#{$&}#{$'}#{$'}" } #BeforeBeforeBeforeMatchAfterAfterAfter

reg = /\d+/
if "12 hogehoge 13" =~ reg
  puts $&
end


if "14 hoge 15" =~ reg
  matchstart = $~.begin(0) # 開始位置
  puts matchstart
  matchend = $~.end(0) - matchstart
  puts matchend
end

# マッチした部分を文字列に書き込む
reg = /\b(\w{8})\b/
if "match word are hogehoge" =~ reg
  puts "マッチしたのは#{$1}"
end

#全マッチリストの取得
result = []
"match word are hogehoge and higehige and hagehage".gsub(reg) { |s| result.push(s) }
puts result

#scanメソッドの使用
puts "match word are hogehoge and higehige and hagehage".scan(reg)

#指定した正規表現に一致する場所で文字列を分割
puts "test<p>hoge</p>hage".split(/<[^<>]*>/)

# 行単位の検索
lines = "hogehoge
higehige
hagehage
magemage
pogepoge".split(/\r?\n/)

re = /age/
lines.each { |line|
  if line =~ re
    puts line
  end
}
