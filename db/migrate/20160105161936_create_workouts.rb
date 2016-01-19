class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :description
      t.string :difficulty
      t.string :duration
      t.string :targeted_muscles
      t.references :user, index: true

      t.timestamps
    end
  end
end
