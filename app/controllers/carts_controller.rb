class CartsController < ApplicationController
  include LineItemsHelper
  before_action :find_cart, only: [:show, :edit, :update, :destroy]
  def index
    @carts = Cart.all
  end

  def show; end

  def new
    @cart = Cart.new
  end

  def edit; end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html{redirect_to @cart}
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
      format.html{redirect_to carts_url}
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
