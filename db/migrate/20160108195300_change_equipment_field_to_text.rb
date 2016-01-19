class ChangeEquipmentFieldToText < ActiveRecord::Migration
  def change
    change_column :exercises, :equipment, :text
  end
end
