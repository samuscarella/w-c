class CreateTargetedMuscles < ActiveRecord::Migration
  def change
    create_table :targeted_muscles do |t|
      t.string :name

      t.timestamps
    end
  end
end
