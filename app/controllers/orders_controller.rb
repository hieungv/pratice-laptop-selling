class OrdersController < ApplicationController
  include LineItemsHelper
  before_action :find_order, only: [:show, :edit, :update,
   :destroy, :show_code_order]

  def index
    @orders = Order.all.page(params[:page]).per Settings.limit_page_admin
  end

  def show
    @cart_code = LineItem.where order_id: params[:cart_code]
  end
  def show_code_order; end

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
          redirect_to show_code_order_path(id: @order),
            notice: I18n.t("order_controller.mess_order_success")
        end
        format.js
        format.json{render "/", status: :created}
      else
        format.html{render :new}
        format.json{render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def update
    @orders = Order.all
    @order = Order.find_by id: params[:id]
    @order.status_finish
    respond_to do |format|
      format.html{redirect_to check_order_admin_path}
<<<<<<< HEAD
      format.js {}
=======
      format.js
>>>>>>> Update Status
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
