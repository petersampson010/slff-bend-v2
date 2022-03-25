class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users, id: false do |t|
      t.integer :admin_user_id, primary_key: true 
      t.string :email, index: {unique: true}, null: false
      t.string :password_digest, null: false
      t.string :club_name, index: {unique: true}, null: false
      t.boolean :confirm_email, default: false
      t.string :confirm_token
      t.timestamps
    end
  end
end
