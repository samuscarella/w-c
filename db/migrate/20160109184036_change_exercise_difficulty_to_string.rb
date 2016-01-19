class ChangeExerciseDifficultyToString < ActiveRecord::Migration
  def change
    change_column :exercises, :difficulty, :string
  end
end
