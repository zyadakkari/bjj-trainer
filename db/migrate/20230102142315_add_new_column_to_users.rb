class AddNewColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_reference :users, :gym, null: false, foreign_key: true
    add_column :users, :belt, :string
  end
end
