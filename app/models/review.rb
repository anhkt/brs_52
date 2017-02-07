class Review < ApplicationRecord
  belong_to :book
  belong_to :user

  has_many :comments
end
