class Public::ProductsController < ApplicationController
  def top
  end

  def about
  end

  def index
    @products = Product.page(params[:page]).per(8).order(updated_at: :desc)
    @tax = 1.1
  end

  def show
    @product = Product.find(params[:id])
    @tax = 1.1
  end
end
