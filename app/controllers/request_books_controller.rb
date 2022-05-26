# frozen_string_literal: true

class RequestBooksController < ApplicationController
  def index
    @request_books = RequestBook.all
  end
end
