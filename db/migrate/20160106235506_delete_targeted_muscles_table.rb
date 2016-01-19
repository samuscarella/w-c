class DeleteTargetedMusclesTable < ActiveRecord::Migration
  def change
    drop_table(:targeted_muscles)
  end
end
