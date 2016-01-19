class RemoveAndAddColumnDifficulty < ActiveRecord::Migration
  def change
    remove_column :exercises, :difficulty
    add_column :exercises, :difficulty, :integer
  end
end
