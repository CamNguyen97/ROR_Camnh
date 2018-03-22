module ApplicationHelper

  def full_title ptitle = ""
    if ptitle.empty?
      I18n.t("base_title")
    else
      ptitle + " | " + I18n.t("base_title")
    end
  end

end
