
tags_names = ["tag 1", "tag 2", "tag 3"]

5.times do
  FactoryBot.create(:author)
end

5.times do |number|
  Category.create name: "Category #{number}"
end

10.times do
  book = FactoryBot.create(:book)
  book.tag_list.add(tags_names.sample)
  book.save
end

5.times do
  FactoryBot.create(:user)
end

5.times do
  FactoryBot.create(:comment)
end

5.times do
  RequestBook.create(
    user_id: rand(1..5),
    book_id: rand(1..10)
  )
end

admin_user = AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
another_user = AdminUser.create!(email: 'another@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

admin_user.add_role("Super Admin")
another_user.add_role("Content Manager")
