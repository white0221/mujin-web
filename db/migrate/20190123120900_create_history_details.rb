class CreateHistoryDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :history_details do |t|
      t.references :history
      t.references :item
      t.integer :quantity

      t.timestamps
    end
  end
end
