class AddColumnToDifficulties < ActiveRecord::Migration
  def change
    add_reference :difficulties, :workout, index: true
  end
end
