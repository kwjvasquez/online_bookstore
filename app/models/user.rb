# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :comments, dependent: :destroy
  has_many :request_books
  has_one_attached :avatar

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first
    user ||= User.create(
      first_name: data["first_name"],
      last_name: data["last_name"],
      email: data["email"],
      password: Devise.friendly_token[0, 20]
    )

    user
  end
end
