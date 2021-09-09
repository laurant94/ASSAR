class AddMarkToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :mark, :integer, default: 1
    add_column :posts, :statut, :integer, default: 1
    add_column :posts, :state, :integer, default: 1
    add_column :posts, :published_at, :timestamp
    add_column :posts, :unpublished_at, :timestamp
    add_column :posts, :marked_to, :timestamp
    add_column :posts, :marke_end_to, :timestamp
  end
end
