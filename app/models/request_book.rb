# frozen_string_literal: true

class RequestBook < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
