# frozen_string_literal: true

module Books
  class Import
    def initialize(books:)
      @books = books
    end

    def call
      @books.each do |book_data|
        book = Book.find_by(code: book_data[:code])
        if book
          book.update(book_data.except(:tags))
        else
          book = Book.create(book_data.except(:tags))
        end
        Books::AddTags.new(book: book, tags: book_data[:tags]).call
      end
    end
  end
end
