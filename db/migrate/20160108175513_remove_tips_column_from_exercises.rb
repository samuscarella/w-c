class RemoveTipsColumnFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :tips
  end
end
