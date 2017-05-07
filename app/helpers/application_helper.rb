module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title_page"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def flash_class level
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    when :success then "alert-success"
    end
  end

  def flash_message flash_type, *params
    if params.empty?
      t "flashs.messages.#{flash_type}", model_name: controller_name.classify
    else
      t "flashs.messages.#{flash_type}", models_name: params[0].join(", ") unless params[0].empty?
    end
  end

  def user_avatar user
    avatar = user.avatar.blank? ? "default-user-img.png" : user.avatar
    image_tag avatar,
      class: "img-circle profile-user-img img-responsive img-circle",
      alt: t("users.headers.avatar")
  end

  def book_image book
    image = book.image.blank? ? "book-default.jpg" : book.image
    image_tag image,
      alt: t("books.headers.image")
  end

  def i18n_enum model_name, enum
    enum = enum.to_s.pluralize
    model_name = model_name.to_s
    model_name.classify.constantize.public_send(enum).keys.map do |key|
      OpenStruct.new key: key, value: t("#{model_name.pluralize}.#{enum}.#{key}")
    end.flatten
  end
end
