class CreateJoinTableAchievementsStudents < ActiveRecord::Migration
  def change
    create_table :achievements_students do |t|
      t.string :achievement_id
      t.string :student_id

      t.timestamps null: false
    end
  end
end
