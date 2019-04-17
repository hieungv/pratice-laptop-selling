class CreateDetailBills < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_bills do |t|
      t.integer :bill_id
      t.integer :amount
      t.integer :price
      t.integer :product_id

      t.timestamps
    end
  end
end
