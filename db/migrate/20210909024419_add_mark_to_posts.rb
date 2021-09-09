class AddMarkToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :mark, :integer, default: 1
  end
end
