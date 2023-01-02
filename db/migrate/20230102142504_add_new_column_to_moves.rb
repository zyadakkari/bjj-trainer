class AddNewColumnToMoves < ActiveRecord::Migration[7.0]
  def change
    add_reference :moves, :training_session, null: false, foreign_key: true
    add_reference :moves, :roll, null: false, foreign_key: true
  end
end
