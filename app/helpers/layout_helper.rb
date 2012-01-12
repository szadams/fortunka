# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
    @show_title = show_title
  end
  def show_title?
    @show_title
  end
  def navigation(*data)
    content tag :ul do
      data.map do |link, name|
        content_tag :li, link_to("#{name}", link),
          :class => ("active" if controller.controller_name == link[1, link.length])
      end
    end
  end
end
