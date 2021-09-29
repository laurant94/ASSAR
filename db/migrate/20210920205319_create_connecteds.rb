class CreateConnecteds < ActiveRecord::Migration[5.2]
  def change
    create_table :connecteds do |t|
      t.references :parent, references: :churches, foreign_key: {to_table: :churches}
      t.references :auth, references: :churches, foreign_key: {to_table: :churches}
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
