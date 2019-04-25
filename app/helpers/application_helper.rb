module ApplicationHelper
  def readable_date(date)
    return "[unknown]" unless date
    return (
      "<span class='date' title='".html_safe +
      date.to_s +
      "'>".html_safe +
      time_ago_in_words(date) +
      " ago</span>".html_safe
    )
  end

  def top_ten(category)
    # return "No top #{category}!" unless category
    # return (
    #   10.times do 
    #     "#{<%= link_to category.title, } by #{category.creator}"
    #     "x votes"
    # )
  end
end
