class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.string :type
      t.integer :points
      t.references :user, null: false, foreign_key: true
      t.string :initiator

      t.timestamps
    end
  end
end
