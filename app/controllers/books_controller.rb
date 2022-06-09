# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.order(:name).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def import_from_csv
    ImportBooksJob.perform_later
    redirect_to books_path
  end
end
