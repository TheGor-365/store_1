class CreateItemsOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :items_orders, id: false do |t|
      t.references :items, null: false, foreign_key: true
      t.references :orders, null: false, foreign_key: true
    end
  end
end
