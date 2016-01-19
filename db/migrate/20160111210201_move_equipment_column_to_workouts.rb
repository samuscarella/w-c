class MoveEquipmentColumnToWorkouts < ActiveRecord::Migration
  def change
    remove_column :exercises, :equipment
    add_column :workouts, :equipment, :string
  end
end
