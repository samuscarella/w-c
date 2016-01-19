class RemoveDifficultiesTable < ActiveRecord::Migration
  def change
    drop_table(:difficulties)
  end
end
