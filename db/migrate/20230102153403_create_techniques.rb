class CreateTechniques < ActiveRecord::Migration[7.0]
  def change
    create_table :techniques do |t|
      t.string :name
      t.string :type
      t.integer :points

      t.timestamps
    end
  end
end
