require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end


st1 = Student.new(22, 2, 'Jawad', true)
puts st1.play_hooky

st1 = Student.new(22, 2)
puts st1.play_hooky
