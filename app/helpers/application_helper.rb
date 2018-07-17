module ApplicationHelper
  def formatted_date(date)
    date.strftime('%B %d, %Y %I:%M %p')
  end
end
