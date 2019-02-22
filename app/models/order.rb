class Order < ApplicationRecord
  has_many :order_products
  has_one :bill
  belongs_to :user
end
