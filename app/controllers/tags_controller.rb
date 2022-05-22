# frozen_string_literal: true

class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.order(:name).page(params[:page])
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @books_related = Book.tagged_with(@tag.name).order(:name).page(params[:page])
    @books_with_this_tag = @books_related.count
  end
end
