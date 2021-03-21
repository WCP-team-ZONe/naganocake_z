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
    @sum = 0
    @cart_products = CartProduct.all

    @order = Order.new(order_params)

    if params[:order][:option] == "0"
      @order.postal_code = @my_postal_code
      @order.address = @my_address
      @order.name = @my_name

    elsif params[:order][:option] == "1"
      shipping_address = Address.find(params[:order][:address_id])

      @order.postal_code = shipping_address.postal_code
      @order.address = shipping_address.address
      @order.name = shipping_address.name

    elsif params[:order][:option] == "2"

    end

    @order.postage = @postage
  end


  def create
    @saved_order.new(order_params)
    @saved_order.postage = @postage
    @saved_order.member_id = current_member.id
    @saved_order.save
    redirect_to orders_complete_path
  end

  def complete
  end


  def index
  end

  def show
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
end