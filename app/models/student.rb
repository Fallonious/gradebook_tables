class Student < ActiveRecord::Base
  has_secure_password

  has_many :grades
  has_many :parents

  belongs_to :teacher

  def self.get_all_children_for_teacher_id( teacher_id )
    teachers_children = []

    self.all.each do |student|
      if student.teacher_id == teacher_id
        teachers_children << student
      end
    end

    return teachers_children
  end


  def self.get_all_children
    children = []

    self.all.each do |sort|
      children << sort.name
    end
    return children
  end


  def self.get_all_children_email_pairs
    pair = []

    self.all.each do |sort|
      pair << [sort.name,sort.student_email]
    end
    return pair
  end
end
