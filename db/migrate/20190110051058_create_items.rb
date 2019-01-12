class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :value, null:false
      t.integer :aruco_id, unique: true

      t.timestamps
    end
  end
end
