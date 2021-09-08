class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone, null: false
      t.string :email
      t.string :password_digest
      t.integer :role, null: false, default: 1
      t.string :token
      t.boolean :approved, default: false, null: false
      t.string :profession
      t.string :nationality
      t.string :city
      t.string :district
      t.text :location_description
      t.date :birthday
      t.string :location
      t.text :bio
      t.integer :matricule
      
      t.timestamps
    end
  end
end
