#コレクションのカプセル化
#人(Person)がコース(Course)を受講する。
class Course
  def initialize(name, advanced)
    @name = name
    @advanced = advanced
  end
end

class Person
  attr_accessor :courses
end

kent = Person.new
courses = []
courses << Course.new("Smalltalk Programming", false)
courses << Course.new("Appreciating Single Malts", false)
kent.courses = courses

#このインターフェイスをつかって次のようにcoursesが変更されているとする
refactoring = Course.new("Refactoring", true)
kent.courses << refactoring
kent.courses << Course.new("Brutal Sarcasm", false)
kent.courses.delete(refactoring)

