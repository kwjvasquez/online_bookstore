# frozen_string_literal: true

class RequestBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum state: {
    pending: 0,
    processing: 1,
    completed: 2,
    canceled: 3
  }
end
