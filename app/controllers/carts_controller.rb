class CartsController < ApplicationController
  include LineItemsHelper
  before_action :find_cart, only: [:show, :update, :destroy]
  def index
    @carts = []
    return if session[:cart_id].nil?
    @carts << Cart.find_by_id(session[:cart_id])
    @product = Product.all.page(params[:page]).per Settings.limit_page_admin
  end

  def show
    @carts = []
    return if session[:cart_id].nil?
    @carts << Cart.find_by_id(session[:cart_id])
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html{redirect_to "/"}
        format.json{render :show, status: :created, location: @cart}
      else
        format.html{render :new}
        format.json{render json: @cart.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html{redirect_to "/"}
      format.json{head :no_content}
    end
  end

  private

  def find_cart
    return if @cart = Cart.find_by(id: params[:id])
    redirect_to root_path
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
