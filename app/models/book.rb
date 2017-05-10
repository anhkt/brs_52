class Book < ApplicationRecord
  include RandomRecord

  ATTRIBUTES_PARAMS = [:title, :author, :description, :image, :publish_date,
    :number_of_pages, :category_id]

  scope :book_challenge, ->{order rating: :asc}
  scope :order_by_time, -> {order created_at: :desc}

  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :favorite_books, dependent: :destroy
  has_many :users, through: :favorite_books
  has_many :ratings, dependent: :destroy

  mount_uploader :image, ImageUploader

  private
  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "category_id", "created_at", "description"]

  def self.ransackable_attributes auth_object = nil
    column_names - UNRANSACKABLE_ATTRIBUTES + _ransackers.keys
  end
end
