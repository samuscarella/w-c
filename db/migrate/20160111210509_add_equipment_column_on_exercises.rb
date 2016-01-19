class AddEquipmentColumnOnExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :equipment, :string
  end
end
