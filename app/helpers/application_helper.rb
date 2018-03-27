module ApplicationHelper

  def full_title ptitle = ""
    if ptitle.empty?
      t "base_title"
    else
      ptitle + " | " + t("base_title")
    end
  end

end
