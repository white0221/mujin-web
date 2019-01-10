class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.references :user, foreign_key: true
      t.boolean :responce, null: false

      t.timestamps
    end
  end
end
