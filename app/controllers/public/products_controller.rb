class Public::ProductsController < ApplicationController
  before_action :set_tax

  def top
  end

  def about
  end

  def index
    @products_count = Product.all
    @products = Product.page(params[:page]).per(8).order(updated_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end
end
