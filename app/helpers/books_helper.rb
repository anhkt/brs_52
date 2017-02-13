module BooksHelper
  def book_image book
    if book.image.blank?
      image_tag "https://c2.staticflickr.com/6/5828/23114683296_880a14ecea_o.jpg"
    else
      image_tag book.image.url
    end
  end

  def publish_date book
    unless book.publish_date.blank?
      l book.publish_date
    end
  end
end
