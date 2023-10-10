class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..5000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    age.to_i >= 18
  end
end

person1 = Person.new(22, 'Ahmad', parent_permission: true)
puts person1.can_use_services?

person2 = Person.new(22)
puts person2.can_use_services?
