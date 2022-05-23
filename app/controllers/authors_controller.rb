# frozen_string_literal: true

class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name).page(params[:page])
  end

  def show
    @author = Author.find(params[:id])
    @amount_of_books_published = @author.books.count
    @author_books = @author.books.order(:name).page(params[:page])
  end
end
