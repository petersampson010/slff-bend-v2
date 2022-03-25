class CreateUserGameweekJoiners < ActiveRecord::Migration[7.0]
  def change
    create_table :user_gameweek_joiners, id: false do |t|
      t.integer :ug_id, primary_key: true 
      t.integer :total_points, null: false
      t.integer :user_id, null: false
      t.integer :gameweek_id, null: false
      t.integer :admin_user_id, null: false

      t.timestamps
    end
  end
end
