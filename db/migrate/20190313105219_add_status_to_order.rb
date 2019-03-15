class AddStatusToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :string, default: "dang xu ly"
  end
end
