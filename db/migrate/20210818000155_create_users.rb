class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :phone
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :password_digest
      t.string :activated
      t.string :token

      t.timestamps
    end
  end
end
