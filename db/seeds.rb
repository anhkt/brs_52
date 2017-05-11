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
  password_confirmation: "12345678",
  avatar: File.open(File.join(Rails.root, "app/assets/images/images.jpg")))

Category.create! ([
  {name: "Tradition"},
  {name: "Category 1"},
  {name: "Category 0"},
  {name: "Category 2"},
  {name: "Category 3"},
  ])

Book.create!([
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book 1", category_id: 1, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book 2", category_id: 1, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book 3 1", category_id: 1, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book 4", category_id: 1, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book 5", category_id: 3, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "12book 63", category_id: 1, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book 7", category_id: 2, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book81", category_id: 3, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book91", category_id: 2, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book 11", category_id: 3, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))},
  {author: "Trung", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    title: "book 2", category_id: 2, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/book-default.jpg"))}
])

10.times do |n|
  Review.create! content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    book_id: n + 1, user_id: 2
end

11.times do |n|
  Rating.create! rating: 3, user_id: 1, book_id: n + 1, review_id: n + 1
end
Comment.create! content: "HHHH", review_id: 1, user_id: 1
