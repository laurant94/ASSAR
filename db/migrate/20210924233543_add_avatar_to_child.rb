class AddAvatarToChild < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :avatar, :text
  end
end
