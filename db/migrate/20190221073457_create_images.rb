class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :image, default: "laptop/#{rand(1..8)}.jpg"
      t.string :name

      t.timestamps
    end
  end
end
