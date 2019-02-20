class StaticPagesController < ApplicationController
  def index
    @products = Product.page(params[:page]).per 30
    @products_fratured = Product.all.limit(4)
  end

  def compair; end

  def components; end

  def contact; end

  def faq; end

  def forgetpass; end

  def legal_notice; end

  def login; end

  def normal; end

  def product_details; end

  def product_summary; end

  def register; end

  def special_offer; end

  def tac; end
end
