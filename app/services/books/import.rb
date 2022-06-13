# frozen_string_literal: true

module Books
  class Import
    def initialize(books:)
      @books = books
    end

    def call
      @books.each do |book_data|
        book = Book.find_or_initialize_by(code: book_data[:code]) do |new_book|
          new_book.assign_attributes(book_data.except(:code, :tags))
        end
        if book.new_record?
          book.save
        else
          book.update(book_data.except(:tags))
        end
        Books::AddTags.new(book: book, tags: book_data[:tags]).call
      end
    end
  end
end
