module ApplicationHelper
  def page_title(title = "")
    base_title = "宮城のタイピング"
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
