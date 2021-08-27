class CreateJoinTablesFaithfulsGroups < ActiveRecord::Migration[5.2]
  def change
    create_join_table :faithful, :group do |t|
      t.references :faithful, references: :users, foreign_key: {to_table: :users}
      t.references :group, foreign_key: true
    end
  end
end
