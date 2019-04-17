class LineItemsController < ApplicationController
  include LineItemsHelper
  before_action :find_line_item, only: [:edit, :update, :destroy]
  def index
    @line_items = LineItem.all
  end

  def show
    @cart_code = LineItem.where order_id: params[:cart_code]
  end

  def new
    @line_item = LineItem.new
  end

  def edit; end

  def create
    product = Product.find params[:product_id]
    @line_item = current_cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html{redirect_to "/"}
        format.js
        format.json{render :show, status: :created, location: @line_item}
      else
        format.html{render :new}
        format.json do
          render json: @line_item.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def find_line_item
    return if @line_item = LineItem.find(params[:id])
    redirect_to root_path
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id)
  end
end
