class Book < ApplicationRecord
  include RandomRecord

  ATTRIBUTES_PARAMS = [:title, :author, :description, :image, :publish_date,
    :number_of_pages, :category_id]

  scope :book_challenge, ->{order rating: :asc}

  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :favorite_books, dependent: :destroy
  has_many :users, through: :favorite_books
  has_many :ratings, dependent: :destroy

  mount_uploader :image, ImageUploader
end
