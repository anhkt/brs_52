class UserBook < ApplicationRecord
  ATTRIBUTE_PARAMS = [:user_id, :book_id, :status]

  belongs_to :book
  belongs_to :user

  enum status: {want_to_read: 0, reading: 1, read: 2}
end
