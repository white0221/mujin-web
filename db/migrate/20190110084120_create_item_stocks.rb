class CreateItemStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :item_stocks do |t|
      t.references :item, foreign_key: true
      t.integer :stock, null: false

      t.timestamps
    end
  end
end
