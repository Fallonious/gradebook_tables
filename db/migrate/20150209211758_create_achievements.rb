class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.date :date_on
      t.integer :point_value

      t.timestamps null: false
    end
  end
end
