class Public::ProductsController < ApplicationController
  before_action :set_tax

  def top
    @product = Product.all.order("created_at DESC").limit(4)
  end

  def about
  end

  def index
    @products_count = Product.all
    @products = Product.page(params[:page]).per(8).order(updated_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @add_product = CartProduct.new
  end
end
