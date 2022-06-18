require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def all_booklist
    puts 'There is no book found in the store' if
    @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def all_peoplelist
    puts 'No people found!' if @people.empty?
    @people.each { |person| puts "[#{person.class}], Age: #{person.age}, Name: #{person.name}, Id: #{person.id}" }
  end

  def create_person
    print 'Missing student or teacher? create student (1) or a teacher (2)
        [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'invalid input'
    end
    puts 'Person created successfully'
  end

  def create_teacher
    print 'teacher age: '
    age = gets.chomp

    print 'teacher specialization: '
    specialization = gets.chomp

    print 'teacher name: '
    name = gets.chomp

    teacher = Teacher.new(age, specialization, name, parent_permission: true)
    puts 'New teacher was created succefully'
    @people.push(teacher)
  end

  def create_student
    print 'student age: '
    age = gets.chomp

    print 'student name: '
    name = gets.chomp

    print 'Parent permission [Yes or No]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'no'
      student = Student.new(age, name, parent_permission: false)
      @people.push(student)
    when 'yes'
      student = Student.new(age, name, parent_permission: true)
      @people.push(student)
    end
    puts 'New student was created successfully'
  end

  def create_book
    print 'book title: '
    title = gets.chomp

    print 'book author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'New book item was successfully created'
  end

  def create_rental
    if @books.size.zero?
      puts 'Books not found'
    elsif @people.size.zero?
      puts 'Person Not found'
    else
      puts 'select book item by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      selected_book = gets.chomp.to_i

      puts 'select a person by number'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      selected_person = gets.chomp.to_i

      puts 'Enter date [YYYY-MM-DD]'
      date = gets.chomp.to_s

      rental_item = Rental.new(date, @books[selected_book], @people[selected_person])
      @rentals.push(rental_item)
      puts 'Rental was created successfully'
    end
  end

  def rentalslist
    puts 'inter person id'
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.to_i == id.to_i
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
