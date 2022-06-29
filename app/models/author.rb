# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :photo, content_type: ["image/jpg", "image/jpeg", "image/png"],
                    size: { less_than: 1.megabytes, message: "Is too large" }
end
