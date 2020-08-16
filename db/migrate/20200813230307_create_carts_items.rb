class CreateCartsItems < ActiveRecord::Migration[6.0]
  def change
    create_table :carts_items do |t|
      t.references :carts, null: false, foreign_key: true
      t.references :items, null: false, foreign_key: true
    end
  end
end
