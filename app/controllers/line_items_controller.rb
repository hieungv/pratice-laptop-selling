class LineItemsController < ApplicationController
  include LineItemsHelper
  before_action :find_line_item, only: [:show, :edit, :update, :destroy]
  def index
    @line_items = LineItem.all
  end

  def show; end

  def new
    @line_item = LineItem.new
  end

  def edit; end

  def create
    product = Product.find params[:product_id]
    @line_item = current_cart.line_items.build product: product
    respond_to do |format|
      if @line_item.save
        format.html{redirect_to @line_item.cart}
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
