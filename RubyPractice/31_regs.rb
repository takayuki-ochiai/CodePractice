BOY = 0
GIRL = 1
@memo = {}

def make_team(students, member_num)
  cnt = 0
  return 1 if students.size == member_num
  return @memo[students] if @memo.has_key?(students)
  if students[-1] == GIRL
    students.push(BOY)
    cnt += make_team(students, member_num)
  else
    new_students = students.clone
    new_students.push(BOY)
    cnt += make_team(new_students, member_num)
    students.push(GIRL)
    cnt += make_team(students, member_num)
  end
  cnt
end

cnt = 0
cnt = make_team([BOY], 30) + make_team([GIRL], 30)
puts cnt
