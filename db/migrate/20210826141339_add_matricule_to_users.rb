class AddMatriculeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :matricule, :string
  end
end
