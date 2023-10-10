require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

st1 = Student.new(22, 2, 'Jawad', parent_permission: true)
puts st1.play_hooky

st2 = Student.new(22, 2)
puts st2.play_hooky
