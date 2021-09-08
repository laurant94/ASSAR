class CreateAppChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.string :acronym
      t.string :phone
      t.string :email
      t.string :city
      t.string :district
      t.string :location
      t.string :location_description
      t.string :post_code
      t.integer :count_connected
      t.references :manager, references: :users, foreign_key: {to_table: :users}, required: false
      t.references :president, references: :users, foreign_key: {to_table: :users}, required: false
      t.references :vice_president, references: :users, foreign_key: {to_table: :users}, required: false
      t.references :secretary, references: :users, foreign_key: {to_table: :users}, required: false
      
      t.references :admin, references: :users, foreign_key: {to_table: :users}, required: false
      t.references :church, foreign_key: true
      t.timestamps
    end
  end
end
