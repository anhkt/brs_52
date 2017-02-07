class Activity < ApplicationRecord
  belong_to :user

  has_many :likes
end
