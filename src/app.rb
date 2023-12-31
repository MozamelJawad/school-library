require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # list of books

  def list_books
    puts(@books.map { |book| "Title: \"#{book.title}\", Author \"#{book.author.capitalize}\"" })
  end

  # list of people

  def list_people
    puts(@people.map do |person|
           "[#{person.class}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}"
         end)
  end

  # create person

  def create_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case option
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      @people << Student.new(age, name, parent_permission: (permission == 'y'))
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name)
    end
    puts 'Person Created Successfully'
  end

  # create book

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book Created Successfully'
  end

  # create rental

  def create_rental
    puts 'Select a book from the following list by number'
    @books.map.with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not ID)'
    @people.map.with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end
    person_index = gets.chomp.to_i

    print 'Date (YYYY/MM/DD): '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental Created Successfully'
  end

  # create list_rentals

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    puts(@rentals.filter_map do |rental|
           if rental.person.id == person_id
             "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author.capitalize}"
           end
         end)
  end
end
