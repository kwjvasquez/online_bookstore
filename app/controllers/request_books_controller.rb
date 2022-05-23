# frozen_string_literal:

class RequestBooksController < ApplicationController
  def new
    @request_book = RequestBook.new
    @users = User.all
    @books = Book.all
  end

  def create
    @request_book = RequestBook.new(request_book_params)
  end

  private

  def request_book_params
    params.require(:request_book).permit(:user_id, :book_id)
  end
end
