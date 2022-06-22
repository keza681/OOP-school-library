require_relative '../book'
require_relative '../rental'
require_relative '../student'

describe Book do
  context 'Given title and author' do
    it 'creates a new book with the correct parameters' do
      title = 'some'
      author = 'somes'

      book = Book.new(title, author)

      expect(book.title.first).to eq(title)
      expect(book.author).to eq(author)
      expect(book.rentals).to be_empty
    end
  end

  before :each do
    @book = Book.new('some', 'somes')
  end

  context 'given a rental object' do
    it 'adds the rental object to the rentals list ' do
      student = Student.new(18, 'classroom')
      tmp_book = Book.new('not my book', 'Soufiane')
      rental = Rental.new('18/05/2022', student, tmp_book)

      @book.add_rental(rental)

      expect(@book.rentals).to_not be_empty
      expect(@book.rentals.first).to equal(rental)
    end

    it 'adds multiple rental objects to the rentals list' do
      student = Student.new(18, 'classroom')
      tmp_book = Book.new('not my book', 'Soufiane')
      rental1 = Rental.new('18/05/2022', student, tmp_book)
      rental2 = Rental.new('17/05/2022', student, tmp_book)

      @book.add_rental(rental1)
      @book.add_rental(rental2)

      expect(@book.rentals).to_not be_empty
      expect(@book.rentals.first).to equal(rental1)
      expect(@book.rentals.last).to equal(rental2)
      expect(@book.rentals.length).to be(2)
    end
  end

  context 'Given a book object' do
    it 'generate a hash representation from it' do
      hash = @book.to_hash

      expect(hash[:class]).to eql(@book.class)
      expect(hash[:title]).to eql(@book.title)
      expect(hash[:author]).to eql(@book.author)
    end
  end

  context 'Given a hash representation' do
    it 'generate a book object from it' do
      hash = { 'class' => Book, 'title' => 'my book', 'author' => 'Soufiane'}

      book = Book.create_from_hash(hash)

      expect(book.title.first).to equal(hash['title'])
      expect(book.author).to equal(hash['author'])
      expect(book.rentals).to be_empty
    end
  end
end
