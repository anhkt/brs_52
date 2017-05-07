# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Diem Ly Vu",
  email: "admin@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  is_admin: true)

User.create!(name: "Test",
  email: "test@gmail.com",
  password: "12345678",
  password_confirmation: "12345678")

Category.create! name: "Tradition"

Book.create!(author: "Trung", description: "ABC", title: "123",
  category_id: 1, publish_date: Date.today)

Review.create! rating: 1, content: "123", book_id: 1, user_id: 1
Comment.create! content: "HHHH", review_id: 1, user_id: 1
