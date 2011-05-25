module ApplicationHelper

  def if_current(current)
    'current' if current
  end

  def display_message
    "<span class='notification n-success'>#{flash[:notice]}</span>" if flash[:notice]
  end

end
