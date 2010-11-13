module ApplicationHelper
  def flashes *types
    types.map do |type|
      content_tag :div, content_tag(:div, flash[type], :class => "container"), :class => "flash #{type}" if flash[type].present?
    end.join("\n").html_safe
  end
end