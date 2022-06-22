require_relative './book'
require_relative './person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    person.rentals.push(self)
    @book = book
    book.rentals.push(self)
  end
end
