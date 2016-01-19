class RemoveDifficultiesWorkoutsTable < ActiveRecord::Migration
  def change
    drop_table :difficulties_workouts
  end
end
