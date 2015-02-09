class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.string :child_name
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
