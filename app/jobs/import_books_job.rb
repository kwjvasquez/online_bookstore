# frozen_string_literal: true

class ImportBooksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    books_data = SmarterCSV.process(Rails.root / "db/books.csv")
    Books::Import.new(books: books_data).call
  end
end
