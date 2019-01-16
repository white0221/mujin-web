class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :id
      t.integer :item_id
      t.integer :user_id
      t.integer :quantity
      t.datetime :date
      t.boolean :response_flag

      t.timestamps
    end
  end
end
