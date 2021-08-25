class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profession, :string
    add_column :users, :approved, :boolean
  end
end
