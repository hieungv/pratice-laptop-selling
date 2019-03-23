class OrdersController < ApplicationController
  include LineItemsHelper
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.page(params[:page]).per Settings.limit_page_admin
  end

  def show; end

  def new
    return redirect_to("/", notice: "Your cart is empty") if
      current_cart.line_items.empty?
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new order_params

    @order.add_line_items_from_cart current_cart
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        format.html do
          redirect_to @order,
            notice: I18n.t("order_controller.mess_order_success")
        end
        format.json{render "/", status: :created}
      else
        format.html{render :new}
        format.json{render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def find_order
    @order = Order.find_by(id: params[:id])
  end

  def order_params
    params.require(:order).permit :name, :address, :phone, :pay_type
  end
end
