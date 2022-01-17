class CreateGroupMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :group_messages do |t|
      t.text :content
      t.text :file
      t.boolean :system, null: false, default: false
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.references :replay, references: :group_messages, foreign_key: {to_table: :group_messages}
      t.boolean :deleted, default: false


      t.timestamps
    end
  end
end
