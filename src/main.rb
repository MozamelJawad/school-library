require_relative 'app'

puts "\nWelcome to School Library App!\n\n"

MENU = "Please choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person ID
7 - Exit".freeze

APP = App.new
def switch(get)
  case get
  when 1
    APP.list_books
  when 2
    APP.list_people
  when 3
    APP.create_person
  when 4
    APP.create_book
  when 5
    APP.create_rental
  when 6
    APP.list_rentals
  end
end

def main
  get = 0
  while get != 7 and get < 7
    puts MENU
    get = gets.chomp.to_i
    switch(get)
  end
  puts 'Thank you for using this app!'
end

main
