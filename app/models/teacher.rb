class Teacher < ActiveRecord::Base
  has_secure_password

  def self.classes
    classes = []

    self.all.each do |sort|
      classes << [sort.name, sort.id]
    end
    return classes
  end


  def get_all_children_for_teacher_id( teacher_id )
    teachers_children = []

    self.all.each do |student|
      if student.teacher_id == teacher_id
        teachers_children << student
      end
    end
    return teachers_children
  end

end
