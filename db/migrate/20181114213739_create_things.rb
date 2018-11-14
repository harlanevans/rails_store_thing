class CreateThings < ActiveRecord::Migration[5.2]
  def change
    create_table :things do |t|
      t.string :name
      t.float :price
      t.string :color
      t.belongs_to :store, foreign_key: true

      t.timestamps
    end
  end
end
