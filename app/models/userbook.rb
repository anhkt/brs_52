class Userbook < ApplicationRecord
  belong_to :book
  belong_to :user

  enum status: {init: 0, reading: 1, read: 2}
end
