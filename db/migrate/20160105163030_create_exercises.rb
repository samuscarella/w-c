class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :difficulty
      t.string :equipment
      t.integer :sets
      t.integer :reps
      t.string :tips
      t.references :user, index: true
      t.references :workout, index: true

      t.timestamps
    end
  end
end
