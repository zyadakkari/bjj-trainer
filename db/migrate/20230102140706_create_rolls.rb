class CreateRolls < ActiveRecord::Migration[7.0]
  def change
    create_table :rolls do |t|
      t.integer :duration
      t.references :user, null: false, foreign_key: true
      t.string :opponent
      t.references :training_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
