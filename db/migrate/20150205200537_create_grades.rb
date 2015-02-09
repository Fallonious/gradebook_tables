class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :student_email
      t.string :assignment_name
      t.date :due_on
      t.integer :score

      t.timestamps null: false
    end
  end
end
