class AddColumnToMove < ActiveRecord::Migration[7.0]
  def change
    add_reference :moves, :technique, null: false, foreign_key: true
  end
end
