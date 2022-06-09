# frozen_string_literal: true

class ImportBooksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    args[0].each do |book_data|
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
      book.tag_list.add(book_data[:tags], parse: true)
      book.save
    end
  end
end
