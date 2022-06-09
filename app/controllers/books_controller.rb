# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.order(:name).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def import_from_csv
    books_data = SmarterCSV.process(Rails.root / "db/books.csv")
    p books_data
  end
end
