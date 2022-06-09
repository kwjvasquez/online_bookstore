# frozen_string_literal: true

class ImportBooksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Books::Import.new(books: args[0]).call
  end
end
