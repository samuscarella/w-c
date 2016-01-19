class RemoveTargetedMusclesWorkoutTable < ActiveRecord::Migration
  def change
    drop_table(:targeted_muscles_workouts)
  end
end
