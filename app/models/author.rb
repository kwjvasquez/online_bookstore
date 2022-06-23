# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
end
