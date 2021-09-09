class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author, references: :users, foreign_key: {to_table: :users}
      t.references :child, foreign_key: true
      # t.integer :type, null: false, default: 1
      t.text :thumb

      t.timestamps
    end
  end
end
