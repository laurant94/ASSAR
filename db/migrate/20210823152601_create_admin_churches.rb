class CreateAdminChurches < ActiveRecord::Migration[5.2]
  def change
    create_table :churches do |t|
      t.string :name
      t.string :acronym
      t.integer :category
      t.string :phone
      t.timestamp :foundation_date
      t.string :agrement
      t.string :leader_name
      t.string :country
      t.string :city
      t.string :location
      t.text :location_descriptor
      t.string :email
      t.string :post_code
      t.references :admin, references: :users, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
