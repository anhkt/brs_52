class Book < ApplicationRecord
  ATTRIBUTES_PARAMS = [:title, :author, :description, :image, :publish_date,
    :number_of_pages, :category_id]

  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :favorite_books, dependent: :destroy
  has_many :users, through: :favorite_books

  mount_uploader :image, ImageUploader
end
