class ChangeModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password
    add_column :users, :admin, :boolean
    change_column_default :users, :admin, false
  end
end
