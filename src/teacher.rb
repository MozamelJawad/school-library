require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission = true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

t1 = Teacher.new(22, 'Software Engineering', 'Ahmad', true)
puts t1.can_use_services?

t2 = Teacher.new(22, 'Software Engineering')
puts t2.can_use_services?
