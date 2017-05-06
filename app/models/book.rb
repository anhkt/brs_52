class Book < ApplicationRecord
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :favorite_books, dependent: :destroy
  has_many :users, through: :favorite_books
end
