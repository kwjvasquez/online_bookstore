FactoryBot.define do
  factory :book do
    code { Faker::Internet.uuid }
    name { Faker::Name.first_name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    number_of_pages { Faker::Number.number(digits: 3) }
    date_published { Faker::Date.in_date_period }
    author_id { rand(1..5) }
    category_id { rand(1..5) }
  end
end
