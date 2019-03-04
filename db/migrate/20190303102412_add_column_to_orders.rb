class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pay_type, :string
    add_column :orders, :name, :string
    add_column :orders, :address, :string
    add_column :orders, :phone, :integer
  end
end
