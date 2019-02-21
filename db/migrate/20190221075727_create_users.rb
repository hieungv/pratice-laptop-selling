class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :password
      t.string :account
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
