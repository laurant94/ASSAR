class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :thumb
      t.integer :mark, null: false, default: 1 # type de publication
      t.integer :status, null: false, default: 2 #1: public 
      t.integer :state, null: false, default: 1 #etat de la publlication
      t.datetime :published_at
      t.datetime :unpublished_at
      t.datetime :marked_to
      t.datetime :unmarked_to
      t.integer :searched_amount, null: false, default: 0
      t.integer :find_amount, null: false, default: 0
      t.integer :remaining_amount, null: false, default: 0
      
      t.references :author, references: :users, foreign_key: {to_table: :users}
      t.references :child, foreign_key: true

      t.timestamps
    end
  end
end
