
# evalしましょう。
#  乗算以外を一度でも使うと４桁にならない
# ops = [' + ', ' - ', ' * ', ' / ', '']
ops = [' * ', '']

range = 1000..9999
range.each do |num|
  str = num.to_s
  ops.each do |op1|
    ops.each do |op2|
      ops.each do |op3|
        formula = str[0] + op1 + str[1] + op2 + str[2] + op3 + str[3]
        # /0になっているものは省略
        next if formula =~ /\/\s0/
        # 式が１つも入っていないものも省略
        next if formula !~ /[\+\-*\/]/
        # 0xになっているものは８進数評価されてしまうので、変換
        formula = formula.gsub(/0+(\d)/, '\\1')
        result = eval(formula)
        if result.to_s.reverse == str
          puts num
          break
        end
      end
    end
  end
end
