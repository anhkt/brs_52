class Book < ApplicationRecord
  belongs_to :category

  has_many :reviews
  has_many :userbooks

  scope :search_book_by_search_params, -> search_param do
    where "title LIKE ? OR author LIKE ?",
      "%#{search_param}%", "%#{search_param}%" if search_param.present?
  end
  scope :order_by_id, -> {order id: :desc}

  class << self
    def search search_param, category_id
      if category_id.present?
        Category.find_by(id: category_id).books
      else
        all
      end.search_book_by_search_params(search_param).order_by_id
    end
  end
end
