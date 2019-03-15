class Product < ApplicationRecord
  SELECT_PRODUCT = Product.all.to_a

  has_many :images
  has_many :feedbacks
  has_many :detail_bills
  has_many :order_products
  has_many :product_categorys
  has_many :line_items
  before_destroy :check_if_has_line_item
  scope :search_product,
    ->(name_product){where(Product.arel_table[:name].lower.matches(name_product.downcase))}
  scope :search_product_describe,
    ->(describe_product){where(Product.arel_table[:describe].lower.matches(describe_product.downcase))}
  scope :order_desc, ->{order created_at: :desc}
  private

  def check_if_has_line_item
    return true if line_items.empty?
    return false if errors.add(:base, "This product has a LineItem")
  end
end
