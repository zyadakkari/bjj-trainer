class RemoveColumnsFromMove < ActiveRecord::Migration[7.0]
  def change
    remove_column :moves, :name, :string
    remove_column :moves, :type, :string
    remove_column :moves, :points, :string
  end
end
