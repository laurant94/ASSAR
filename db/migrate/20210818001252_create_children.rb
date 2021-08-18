class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.string :acronym
      t.references :church, foreign_key: true

      t.timestamps
    end
  end
end
