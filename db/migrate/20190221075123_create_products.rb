class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :import_price
      t.integer :export_price
      t.string :describe
      t.string :note
      t.integer :status
      t.integer :image
      t.integer :time_guaranate
      t.integer :sale

      t.timestamps
    end
  end
end
