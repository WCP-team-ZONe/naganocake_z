class Public::CartProductsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_tax

  def index
    @cart_products = CartProduct.all
  end

  def update
  end

  def clear
  end

  def destroy
  end

  def add_products
    @add_product = CartProduct.new(cart_product_params)
    @add_product.member_id = current_member_id
    @add_product.save
    redirect_to "index"
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end
end
