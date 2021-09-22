class CreateConnecteds < ActiveRecord::Migration[5.2]
  def change
    create_table :connecteds do |t|
      t.references :parent, references: :children, foreign_key: {to_table: :children}
      t.references :auth, references: :children, foreign_key: {to_table: :children}
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
