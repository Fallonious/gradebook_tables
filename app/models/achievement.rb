class Achievement < ActiveRecord::Base
  has_and_belongs_to_many :students

  def self.get_assignments_for_student_email(student_email)
    achievements = []
    self.all.each do |achievement|
      if achievement.student_email == student_email
        achievement << achievement
      end
    end
    return achievements
  end
end
