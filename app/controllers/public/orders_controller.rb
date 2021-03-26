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
    @order.postage = @postage
    @sum = 0
    @cart_products = CartProduct.where(member_id: current_member.id)

    if params[:order][:option] == "0"
      @order.postal_code = @my_postal_code
      @order.address = @my_address
      @order.name = @my_name
      @option = "0"
    elsif params[:order][:option] == "1" and params[:order][:address_id].empty?
        redirect_to orders_input_path
        flash[:notice] = "配送先が選択されていません！"
    elsif params[:order][:option] == "1"
      shipping_address = Address.find(params[:order][:address_id])
      @order.postal_code = shipping_address.postal_code
      @order.address = shipping_address.address
      @order.name = shipping_address.name
      @option = "1"
    elsif params[:order][:option] == "2"
      if params[:order][:postal_code].empty? or params[:order][:address].empty? or params[:order][:name].empty?
        redirect_to orders_input_path
        flash[:notice] = "未入力の項目があった為、ページを更新しました！"
      end
      @option = "2"
    end
  end

  def create
    # 注文情報を保存
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.postage = @postage
    @order.save

    # 配送先を保存するアクション
    # バグ修正②
    if params[:option] == "2"
      @address = Address.new(address_params)
      @address.member_id = current_member.id
      @address.save
    end

    # 注文商品を保存
    @cart_products = CartProduct.where(member_id: current_member.id)
      @cart_products.each do |cart_product|
        @ordered_product = @order.ordered_products.new
        @ordered_product.order_id = @order.id
        @ordered_product.product_id = cart_product.product_id
        @ordered_product.quantity = cart_product.quantity
        @ordered_product.purchased_price = cart_product.product.ex_price
        @ordered_product.save
      end
    # カート内全消去
    @cart_products.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = Order.where(member_id: current_member.id)
  end

  def show
    if params[:id] == "check"
      redirect_to cart_products_path
    else
    @order = Order.find(params[:id])
    @ordered_products = OrderedProduct.where(order_id: @order.id)
    end
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

  def address_params
    params.permit(:postal_code, :address, :name)
  end
end