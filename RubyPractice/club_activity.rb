max_area = 0
students = 150
clubs = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14], [1800, 16], [1000, 15], [7000, 40], [100, 10], [300, 12]]

@memo = {}
def max_area(clubs, students, area)
  # 残りの生徒数でクラブを選び続けられる限り実行する
  return area if clubs.empty? || students <= clubs.min_by { |club| club[1] }[1]
  return @memo[[clubs, students]] if @memo.has_key?([clubs, students])
  # 残りのクラブの中から残り生徒数を超えないクラブを選び面積を追加する。
  selectable_clubs = clubs.select { |club| students >= club[1] }
  add_area = 0
  selectable_clubs.each do |selectable_club|
    next_area = max_area(clubs - [selectable_club], students - selectable_club[1], area + selectable_club[0])
    add_area = [add_area, next_area].max
  end
  @memo[[clubs, students]] = add_area
  add_area
end


max_area = 0
clubs.each do |club|
  area = max_area(clubs - [club], students - club[1], club[0])
  max_area = [max_area, area].max
end

puts max_area
