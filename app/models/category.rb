class Category < ApplicationRecord
  ATTRIBUTES_PARAMS = [:name]

  has_many :books, dependent: :destroy
end
