class Public::OrdersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_tax
  before_action :postage
  before_action :my_info

  def input
    @order = Order.new
    @addresses = Address.where(member_id: current_member.id)
  end

  def check
    @order = Order.new(order_params)
    @sum = 0
    @cart_products = CartProduct.where(member_id: current_member.id)

    if params[:order][:option] == "0"
      @order.postal_code = @my_postal_code
      @order.address = @my_address
      @order.name = @my_name
    elsif params[:order][:option] == "1"
      # if params[:order][:address_id].none?
      #   render "check"
      # end
      shipping_address = Address.find(params[:order][:address_id])
      @order.postal_code = shipping_address.postal_code
      @order.address = shipping_address.address
      @order.name = shipping_address.name
    elsif params[:order][:option] == "2"
    end

    @order.postage = @postage
  end

  def create
    # ordersテーブルに保存するアクション
    @order = Order.new(new_order_params)
    @order.member_id = current_member.id
    @order.postage = @postage
    @order.save

    # 配送先を保存するアクション
    @address = Address.new(address_params)
    @address.member_id = current_member.id
    @address.save

    # ordered_productsテーブルに保存するアクション
    @cart_products = CartProduct.where(member_id: current_member.id)
      @cart_products.each do |cart_product|
        # 注文商品テーブルに保存する空箱を作る
        @ordered_product = @order.ordered_products.new
        # カート商品が持つ注文idを代入
        @ordered_product.order_id = @order.id
        # カート商品が持つ商品idを代入
        @ordered_product.product_id = cart_product.product_id
        # カート商品が持つ商品個数を代入
        @ordered_product.quantity = cart_product.quantity
        # カート商品が持つ税抜価格を代入
        @ordered_product.purchased_price = cart_product.product.ex_price
        # 注文商品テーブルに保存
        @ordered_product.save
      end
    # カート内データ全消去
    @cart_products.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = Order.where(member_id: current_member.id)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = OrderedProduct.where(order_id: @order.id)
  end

  def my_info
    @my_postal_code = current_member.postal_code
    @my_address = current_member.address
    @my_name = current_member.family_name + current_member.first_name
  end

# ストロングパラメータ
  private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name, :total_price)
  end

  def new_order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name, :total_price)
  end

  def address_params
    params.permit(:postal_code, :address, :name)
  end
end