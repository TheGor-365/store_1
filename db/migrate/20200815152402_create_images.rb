class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :url
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
