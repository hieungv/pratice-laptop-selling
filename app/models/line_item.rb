class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    @multiply = product.export_price * quantity
    return @multiply if product.sale.zero?
    @multiply - (@multiply * product.sale / 100)
  end
end
