class AddColumnToChildren < ActiveRecord::Migration[5.2]
  def change
    add_reference :children, :church, foreign_key: true
  end
end
