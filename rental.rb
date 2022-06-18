class Rental
  def initialize(data, book, person)
    @data = data
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end

  attr_accessor :date, :book, :person
end
