# frozen_string_literal:

class RequestBooksController < ApplicationController
  def new
    @request_book = RequestBook.new
  end
end
