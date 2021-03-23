class Private::OrdersController < ApplicationController
   before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "入金確認"
        @order.ordered_products.update(production_status: 1) #製作ステータスを"製作待ち"にかえる

    end
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to private_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end


end
