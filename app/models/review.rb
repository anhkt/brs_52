class Review < ApplicationRecord
  include RandomRecord

  ATTRIBUTE_PARAMS = [:content, :book_id, :user_id]

  belongs_to :book
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
  has_many :reports, dependent: :destroy
end
