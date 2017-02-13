class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  has_many :comments

  validates :content, presence: true
  validates :rating, presence: true
end
