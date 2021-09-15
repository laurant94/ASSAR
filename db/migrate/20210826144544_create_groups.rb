class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :acronym
      t.text :description
      t.references :child, foreign_key: true
      t.references :manager, references: :users, foreign_key: {to_table: :users}, required: false

      t.timestamps
    end
  end
end
