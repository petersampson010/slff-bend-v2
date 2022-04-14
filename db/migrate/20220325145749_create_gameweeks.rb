class CreateGameweeks < ActiveRecord::Migration[7.0]
  def change
    create_table :gameweeks, id: false do |t|
      t.integer :gameweek_id, primary_key: true
      t.string :date, null: false
      t.string :opponent, null: false
      t.string :score
      t.integer :gameweek, null: false
      t.boolean :complete, null: false
      t.integer :admin_user_id, null: false

      t.timestamps
    end
  end
end
