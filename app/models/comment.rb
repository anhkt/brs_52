class Comment < ApplicationRecord
  ATTRIBUTE_PARAMS = [:content, :review_id, :user_id]

  acts_as_tree order: "created_at DESC"

  belongs_to :review
  belongs_to :user
end
