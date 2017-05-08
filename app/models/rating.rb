class Rating < ApplicationRecord
  ATTRIBUTE_PARAMS = [:rating, :user_id, :book_id]

  belongs_to :user
  belongs_to :book

  scope :plus, ->{where "rating > 0"}
end
