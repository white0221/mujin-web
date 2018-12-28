class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :email, unique: true
      t.string :password_digest, null: false
      t.boolean :admin_flag, null: false, default: false

      t.timestamps
    end
  end
end
