class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.references :faithful, references: :users, foreign_key: {to_table: :users}
      t.references :post, foreign_key: true
      t.string :mark, default: 1
      t.integer :amount
      t.timestamps
    end
  end
end
