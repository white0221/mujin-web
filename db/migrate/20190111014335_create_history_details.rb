class CreateHistoryDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :history_details do |t|
      t.references :history, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :volume, null: false

      t.timestamps
    end
  end
end
