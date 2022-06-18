class Rental
  attr_accessor :date, :book, :person

  def initialize(data, book, person)
    @data = data
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end
end
