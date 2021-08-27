class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profession, :string
    add_column :users, :approved, :boolean, default: false
  end
end

class AddCityDistrictToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :bio, :text
  end
end