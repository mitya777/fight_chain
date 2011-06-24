module ApplicationHelper

  def logo
    image_tag("logo.png", :alt => "FIGHT CHAIN")
  end

  #Return a title on a per-page basis.
  def title
    base_title = "Fight Chain"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
