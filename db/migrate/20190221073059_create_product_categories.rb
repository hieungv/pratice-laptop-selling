class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.integer :category_id
      t.integer :product_id

      t.timestamps
    end
    add_index :product_categories, [:category_id, :created_at]
    add_index :product_categories, [:product_id, :created_at]
  end
end
