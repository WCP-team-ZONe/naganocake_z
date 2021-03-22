class Public::CartProductsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_tax

  def index
    @sum = 0
    @cart_products = CartProduct.all
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(change_quantity_params)
      flash[:notice] = "カート内を更新しました！"
      redirect_to cart_products_path
    end
  end

  def clear
    @cart_products = CartProduct.all
    @cart_products.destroy_all
    flash[:notice] = "カートを空にしました！"
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    flash[:notice] = "ご指定の商品を削除しました！"
    redirect_to cart_products_path
  end

  def add_products
    # 追加したい商品と個数
    @add_product = current_member.cart_products.build(cart_product_params)
    # 現在カートに入っている商品レコード全て
    @cart_products = current_member.cart_products.all

    @cart_products.each do |cart_product|
      if cart_product.product_id == @add_product.product_id
      new_quantity = cart_product.quantity + @add_product.quantity
        cart_product.update_attribute(:quantity, new_quantity)
        @add_product.delete
      end
    end
    # product_idが一致しなかったときの処理
    @add_product.save
    flash[:notice] = "カートに商品を追加しました！"
    redirect_to cart_products_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:quantity, :product_id)
  end

  def change_quantity_params
    params.permit(:quantity, :product_id)
  end
end