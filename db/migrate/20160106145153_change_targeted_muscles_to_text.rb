class ChangeTargetedMusclesToText < ActiveRecord::Migration
  def change
    change_column(:workouts, :targeted_muscles, :text)
  end
end
