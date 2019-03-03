module CartsHelper
  def find_order_id
    @find_order_id = LineItem.find_by cart_id: params[:id]
  end

  def hide_cart_if?
    find_order_id.present?
  end
end
