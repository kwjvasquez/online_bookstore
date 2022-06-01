FactoryBot.define do
  factory :request_book do
    user_id { rand(1..5) }
    book_id { rand(1..10) }
  end
end
