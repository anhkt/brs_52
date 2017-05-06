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
end
