class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: false do |t|
      t.integer :message_id, primary_key: true
      t.string :name
      t.string :email
      t.string :msg, null: false

      t.timestamps
    end
  end
end
