class Review < ApplicationRecord
  ATTRIBUTE_PARAMS = [:rating, :content, :book_id, :user_id]

  belongs_to :book
  belongs_to :user

  has_many :comments, dependent: :destroy
end
