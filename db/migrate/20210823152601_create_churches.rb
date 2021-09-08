class CreateChurches < ActiveRecord::Migration[5.2]
  def change
    create_table :churches do |t|
      t.string :name
      t.string :acronym
      t.string :phone
      t.string :email
      t.string :country
      t.string :city
      t.string :post_code
      t.string :location
      t.text :location_description
      t.integer :category
      t.timestamp :foundation_date
      t.string :agrement
      t.string :leader_name
      
      t.references :admin, references: :users, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
