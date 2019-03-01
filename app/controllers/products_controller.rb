class ProductsController < ApplicationController
  before_action :admin_user, only: %i(destroy)

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params

    if @product.save
      flash[:info] = t "success"
      redirect_to admin_path
    else
      render :new
    end
  end

  def show
    @product_detail = Product.find_by(id: params[:id])
    @img = Image.find_by(product_id: @product_detail)
    return if @product_detail && @img
    redirect_to root_path
    @find = @cart.line_item
    @show_product_cart = Product.find_by(id: @find)
  end

  def destroy
    @product = Product.find_by id: params[:id]

    if @product.destroy
      flash[:success] = t("success")
    else
      flash[:danger] = t("no_success")
    end
    redirect_to admin_path
  end

  private

  def product_params
    params.require(:product).permit :name, :import_price,
      :export_price, :describe, :note, :status, :image, :time_guaranate, :sale
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
