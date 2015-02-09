module ApplicationHelper

  def title
    base_title = "School Gradebook"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def display_grades(grades)
    result = ""
    grades.each do |grade|
      result << "<tr>"
      result << "<td>#{grade.assignment_name}</td>"
      result << "<td>#{ grade.score }</td>"
      result << "<td>#{ grade.due_on}</td>"
      result << "</tr>"
    end
    result.html_safe
  end

end
