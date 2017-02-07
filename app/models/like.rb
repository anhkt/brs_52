class Like < ApplicationRecord
  belong_to :activity
  belong_to :user
end
