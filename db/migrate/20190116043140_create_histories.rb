class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.references :user, foreign_key: true
      t.integer :quantity
      t.datetime :datetime
      t.boolean :response_flag

      t.timestamps
    end
  end
end
