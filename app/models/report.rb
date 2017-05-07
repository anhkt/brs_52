class Report < ApplicationRecord
  ATTRIBUTE_PARAMS = [:user_id, :review_id, :reason]

  belongs_to :user
  belongs_to :review
end
