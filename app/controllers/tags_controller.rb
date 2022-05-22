# frozen_string_literal: true

class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.order(:name).page(params[:page])
  end
end
