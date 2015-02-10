module ApplicationHelper

  def title
    base_title = "School Achievementbook"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def display_achievements(achivements)
    result = ""
    achievements.each do |achievement|
      result << "<tr>"
      result << "<td>#{achivement.assignment_name}</td>"
      result << "<td>#{ achivement.score }</td>"
      result << "<td>#{ achivement.date_on}</td>"
      result << "</tr>"
    end
    result.html_safe
  end

end
