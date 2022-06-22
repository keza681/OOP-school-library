class Book
  def initialize(title, author)
    @title = title,
             @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
    rental.book = self
  end

  def to_hash
    hash = {}
    hash[:class] = self.class
    hash[:title] = @title
    hash[:author] = @author
    hash[:id] = @id
    hash
  end

  def self.create_from_hash(hash)
    Book.new(hash['title'], hash['author'])
  end
end
