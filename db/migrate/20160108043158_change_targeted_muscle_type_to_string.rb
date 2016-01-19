class ChangeTargetedMuscleTypeToString < ActiveRecord::Migration
  def change
    change_column :workouts, :targeted_muscles, :string
  end
end
