class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :name
      t.references :exercise, index: true

      t.timestamps
    end
  end
end
