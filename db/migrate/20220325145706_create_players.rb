class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players, id: false do |t|
      t.integer :player_id, primary_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :position, null: false
      t.float :price, null: false
      t.string :availability, null: false
      t.integer :admin_user_id, null: false
      t.index [:first_name, :last_name, :admin_user_id], unique: true
      t.timestamps
    end
  end
end
