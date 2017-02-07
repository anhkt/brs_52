class Book < ApplicationRecord
  belong_to :category

  has_many :reviews
  has_many :userbooks
end
