require './app'

class Main
  def self.home_page
    puts 'Please type a valid number: '

    @content = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person (teacher or student)',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
    @content.each { |index, string| puts "#{index} - #{string}" }

    Integer(gets.chomp)
  end

  app = App.new

  loop do
    case home_page
    when 1
      app.all_booklist
    when 2
      app.all_peoplelist
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.rentalslist
    when 7
      puts 'ciao ciao!'
      exit
    else
      puts 'Invalid input or out of the required range!'
    end
  end
end

def main
  App.new
end

Main
