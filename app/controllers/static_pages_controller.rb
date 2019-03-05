class StaticPagesController < ApplicationController
  def index
    @products_fratured = Product.all.limit Settings.limit_featured
    @products = Product.search_product("#{params[:text]}%")
                       .page(params[:page]).order_desc.per Settings.limit_page
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
