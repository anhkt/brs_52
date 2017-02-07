class Request < ApplicationRecord
  belong_to :user

  enum status: {waiting: 0, approve: 1, reject: 2}
end
