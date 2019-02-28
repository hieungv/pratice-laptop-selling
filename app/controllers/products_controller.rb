class ProductsController < ApplicationController
  def show
    @product_detail = Product.find_by(id: params[:id])
    @img = Image.find_by(product_id: @product_detail)
    return if @product_detail && @img
    redirect_to root_path
  end
end
