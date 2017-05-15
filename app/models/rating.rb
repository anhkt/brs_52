class Rating < ApplicationRecord
  ATTRIBUTE_PARAMS = [:rating, :user_id, :book_id]

  belongs_to :user
  belongs_to :book
  belongs_to :review

  after_save :calc_book_rating
  after_destroy :calc_book_rating

  scope :plus, ->{where "rating > 0"}

  private
  def calc_book_rating
    self.book.update_attributes rating: round_rating
  end

  def round_rating
    rating = self.book.ratings.plus.average :rating
    (rating * 2).round / 2.0
  end
end
