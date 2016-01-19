class CreateJoinTableTargetedMuscleWorkout < ActiveRecord::Migration
  def change
    create_join_table :targeted_muscles, :workouts do |t|
      # t.index [:targeted_muscle_id, :workout_id]
      # t.index [:workout_id, :targeted_muscle_id]
    end
  end
end
