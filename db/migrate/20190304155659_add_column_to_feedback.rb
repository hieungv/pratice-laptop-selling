class AddColumnToFeedback < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :name, :string
    add_column :feedbacks, :title, :string
  end
end
