class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.integer :user_id, primary_key: true
      t.string :email, index: {unique: true}
      t.string :team_name, index: {unique: true}, null: false
      t.string :password_digest, null: false
      t.integer :transfers
      t.float :budget
      t.integer :gw_start
      t.boolean :confirm_email, default: false
      t.string :confirm_token
      t.integer :admin_user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
