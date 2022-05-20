# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :message, presence: true
  validates :book_id, uniqueness: { scope: :user_id }
end
