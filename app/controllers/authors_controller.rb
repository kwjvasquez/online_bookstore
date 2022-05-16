# frozen_string_literal: true

class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order("name ASC")
  end
end
