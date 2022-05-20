# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.order(:name).page(params[:page])
  end
end
