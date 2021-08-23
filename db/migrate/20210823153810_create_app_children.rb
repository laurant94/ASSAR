class CreateAppChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.string :acronym
      t.string :country
      t.string :city
      t.string :phone
      t.string :email
      t.string :location
      t.string :location_descriptor
      t.string :post_code
      t.references :president, references: :users, foreign_key: {to_table: :users}, required: false
      t.references :vice_president, references: :users, foreign_key: {to_table: :users}, required: false
      t.references :secretary, references: :users, foreign_key: {to_table: :users}, required: false
      t.references :manager, references: :users, foreign_key: {to_table: :users}, required: false
      t.references :admin, references: :users, foreign_key: {to_table: :users}, required: false

      t.timestamps
    end
  end
end
