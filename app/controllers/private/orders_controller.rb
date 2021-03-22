class Private::OrdersController < ApplicationController
   # before_action :authenticate_admin_user!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to private_orders_path(@order)
    else
      render show
    end
  end

  private

  def order_params
    params.require(:order).premit(:order_status)
  end
end
