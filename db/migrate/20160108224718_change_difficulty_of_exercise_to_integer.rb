class ChangeDifficultyOfExerciseToInteger < ActiveRecord::Migration
  def change
    change_column :exercises, :difficulty, :integer
  end
end
