class Order < ApplicationRecord
  VALID_PHONE = /[0-9]/i
  PAYMENT_TYPES = [I18n.t("order.select_1"), I18n.t("order.select_2")].freeze
  validates :name, :address, presence: true
  validates :pay_type, presence: true, inclusion: PAYMENT_TYPES
  validates :phone, length: {maximum: 10},
    format: {with: VALID_PHONE}, presence: true
  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart cart
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def status_finish
    update_columns status: "finish"
  end
end
