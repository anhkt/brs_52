class FavoriteBook < ApplicationRecord
  ATTRIBUTE_PARAMS = [:user_id, :book_id]

  belongs_to :book
  belongs_to :user
end
