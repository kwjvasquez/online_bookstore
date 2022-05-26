# frozen_string_literal: true

class RequestBooksController < ApplicationController
  def new
    @request_book = RequestBook.new
    @users = User.all
    @books = Book.all
  end

  def create
    @request_book = RequestBook.new(request_book_params)

    if @request_book.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def request_book_params
    params.require(:request_book).permit(:user_id, :book_id)
  end
end
