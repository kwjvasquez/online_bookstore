# frozen_string_literal: true

module Books
  class Import
    def initialize(books:)
      @books = books
    end

    def call
      @books.each do |book_data|
        book = Book.create(
          code: book_data[:code],
          name: book_data[:name],
          description: book_data[:description],
          price: book_data[:price],
          number_of_pages: book_data[:number_of_pages],
          date_published: book_data[:date_published],
          author_id: book_data[:author_id],
          category_id: book_data[:category_id]
        )

        Books::AddTags.new(book: book, tags: book_data[:tags]).call
      end
    end
  end
end
