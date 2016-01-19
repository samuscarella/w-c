class ChangeEquipmentToString < ActiveRecord::Migration
  def change
    change_column :exercises, :equipment, :string
  end
end
