class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records, id: false do |t|
      t.integer :record_id, primary_key: true
      t.boolean :sub
      t.boolean :captain
      t.boolean :vice_captain
      t.integer :user_id, null: false
      t.integer :player_id, null: false
      t.integer :gameweek_id, null: false
      t.integer :admin_user_id, null: false

      t.timestamps
    end
  end
end
