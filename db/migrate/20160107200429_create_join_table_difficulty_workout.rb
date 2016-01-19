class CreateJoinTableDifficultyWorkout < ActiveRecord::Migration
  def change
    create_join_table :difficulties, :workouts do |t|
      # t.index [:difficulty_id, :workout_id]
      # t.index [:workout_id, :difficulty_id]
    end
  end
end
