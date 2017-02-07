class Userbook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum status: {init: 0, reading: 1, read: 2}
end
