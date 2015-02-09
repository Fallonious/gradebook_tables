class Grade < ActiveRecord::Base
  belongs_to :student

  validates :score, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }

  def self.get_assignments_for_student_email( email )
    grades = []

    self.all.each do |grade|
      if grade.student_email == email
        grades << grade
      end
    end

    return grades
  end
end
