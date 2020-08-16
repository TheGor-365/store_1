class CreatePositions < ActiveRecord::Migration[6.0]
  def up
    create_table :positions do |t|
      t.references :carts, null: false, foreign_key: true
      t.references :items, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
    drop_table :carts_items
  end
end
