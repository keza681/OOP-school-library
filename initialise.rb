require 'json'
require './rental'
require './student'
require './teacher'

def init
  File.write('./rentals.json', []) unless
  File.exist?('./rentals.json')
  File.write('./books.json', []) unless
  File.exist?('./books.json')
  File.write('./people.json', []) unless
  File.exist?('./people.json')
end

def read_books
  books = []
  JSON.parse(File.read('./data/book.json')).each do |book|
    books.push(Book.new(book['title'], book['author']))
  end
  books
end

def write_books(books)
  temp = []
  books.each do |book|
    temp.push({
                title: book.title,
                author: book.author
              })
  end

  File.write('./data/book_file.json', JSON.generate(temp).to_s)
end

def write_people(persons)
  temp = []
  persons.each do |person|
    temp << if person.instance_of? Student
              {
                function: 'Student',
                name: person.name,
                age: person.age,
                parent_permission: person.parent_permission
              }
            elsif person.instance_of? Teacher
              {
                function: 'Teacher',
                name: person.name,
                age: person.age,
                specialization: person.specialization
              }
            end
  end

  File.write('./data/people.json', JSON.generate(temp)).to_s
end

def read_people
  people = []
  JSON.parse(File.read('./data/people.json')).each do |person|
    people << case person['function']
              when 'Student'
                Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
              when 'Teacher'
                Teacher.new(person['age'], person['specialization'], person['name'])
              end
  end
  people
end
