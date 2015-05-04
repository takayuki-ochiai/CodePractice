#コレクションのカプセル化
#人(Person)がコース(Course)を受講する。
class Course
  def initialize(name, advanced)
    @name = name
    @advanced = advanced
  end
end

# class Person
#   attr_accessor :courses
# end

# kent = Person.new
# courses = []
# courses << Course.new("Smalltalk Programming", false)
# courses << Course.new("Appreciating Single Malts", false)
# kent.courses = courses

# #このインターフェイスをつかって次のようにcoursesが変更されているとする
# refactoring = Course.new("Refactoring", true)
# kent.courses << refactoring
# kent.courses << Course.new("Brutal Sarcasm", false)
# kent.courses.delete(refactoring)

# #上級講座(advance)が設定されているものについて知りたいクライアントは次のようにする
# person.courses.select{|course| course.advanced? }.size

#最初にやるべきなのはコレクションのカプセル化
class Person
  def initialize
    @courses = []
  end

  def initialize_courses(courses)
    raise "Courses shold be empty" unless @courses.empty
    courses.each{ |course| add_course(course) }
  end

  def add_course(course)
    @courses << course
  end

  def remove_course(course)
    @courses.delete(course)
  end
end

#リーダーを使ってコレクションを変更しているコードを撲滅する
#つまり、add_courseを使うようにする
courses.add_course(Course.new("Smalltalk Programming", false))
courses.add_course(Course.new("Appreciating Single Malts", false))
#うえみたいな感じ

#その上でコレクションのコピーを返すように属性リーダーを書き換えて属性リーダーを使った変更ができないようにする

class Person
  def courses
    @courses.dup
  end
end

#これでコレクションをカプセル化することができる
#また、coursesの属性リーダーが使われているコードを探してPersonクラスに入れるべきコードを探して、インスタンスメソッドにするのもよい。
#たとえば以下のようなメソッドを

kent.courses.size

class Person
  def number_of_courses
    @courses.size
  end
end

kent.number_of_courses

#とするとよい。Personクラスが膨張することはあるが、たいていの場合はこれが問題になることはないらしい。

#気づき: この節の序文がコレクションにたいするカプセル化の方法と理由をしっかり説明してくれている。
# コレクションを持つフィールドに関しては、ゲッターはコレクション自体を返してはならない。リーダーを介してコレクションが変更されてしまう。
# セッターはそもそも定義してはならない。コレクションを変更したいときはそのための要素の追加、削除のメソッドを用意する。それによってコレクションの要素の追加、削除をオーナーオブジェクトが管理できる





