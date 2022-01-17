class CreateRoomMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :room_messages do |t|
      t.text :content
      t.text :file
      t.boolean :system, null: false, default: false
      t.text :description
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
