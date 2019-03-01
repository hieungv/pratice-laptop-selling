class Product < ApplicationRecord
  has_many :images
  has_many :feedbacks
  has_many :detail_bills
  has_many :order_products
  has_many :product_categorys
  has_many :line_items
  before_destroy :check_if_has_line_item

  private

  def check_if_has_line_item
    return true if line_items.empty?
    return false if errors.add(:base, "This product has a LineItem")
  end
end
