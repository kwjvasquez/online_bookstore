# frozen_string_literal: true

class RequestBook < ApplicationRecord
  include AASM

  belongs_to :book
  belongs_to :user

  aasm column: :state do
    state :pending, initial: true
    state :processing, :completed
    state :canceled

    event :review do
      transitions from: :pending, to: :processing
    end

    event :ready do
      transitions from: :processing, to: :completed
    end

    event :cancel do
      transitions from: %i[pending processing], to: :canceled
    end
  end
end
