class UserBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum status: {reading: 0, read: 1}
end
