FactoryBot.define do
  factory :comment do
    message { Faker::Lorem.sentence }
    user_id { rand(1..5) }
    book_id { rand(1..10) }
    approved { true }
  end
end
