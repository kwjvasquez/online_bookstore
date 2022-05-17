# frozen_string_literal: true

class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name).page(params[:page])
  end
end
