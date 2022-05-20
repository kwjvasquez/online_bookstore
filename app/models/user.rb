# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, email: true
  validates :date_of_birth, format: {
    with: /\A\d{4}\b-\d{1,2}\b-\d{1,2}\z/
  }
end
