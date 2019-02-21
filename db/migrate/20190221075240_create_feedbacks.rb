class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :content

      t.timestamps
    end
    add_index :feedbacks, [:product_id, :created_at]
  end
end
