# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 30 },
                   format: {
                     with: /\A[a-zA-Z0-9 ]*\z/,
                     message: "Invalid name, avoid use special characters"
                   }
  validates :price, presence: true,
                    numericality: {
                      greater_than_or_equal_to: 0, less_than: 10_000
                    },
                    format: {
                      with: /\A\d{1,4}\.\d{2}\z/,
                      message: "Invalid price"
                    }
  validates :number_of_pages, presence: true, numericality: { only_integer: true }
  validates :date_published, presence: true

  before_validation :set_code

  private

  def set_code
    self.code ||= SecureRandom.uuid
  end
end
