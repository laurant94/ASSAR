class CreateChurches < ActiveRecord::Migration[5.2]
  def change
    create_table :churches do |t|
      t.string :name
      t.string :acronym
      t.references :admin, references: :users, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
