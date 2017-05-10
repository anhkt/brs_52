class Category < ApplicationRecord
  ATTRIBUTES_PARAMS = [:name]

  has_many :books, dependent: :destroy

  private
  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at"]

  def self.ransackable_attributes auth_object = nil
    column_names - UNRANSACKABLE_ATTRIBUTES + _ransackers.keys
  end
end
