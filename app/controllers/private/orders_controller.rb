class Private::OrdersController < ApplicationController

  PER = 10

  def index
    @orders = Order.all
    @orders_page = Order.page(params[:page]).per(PER)
  end

  def show
  end

  def update
  end
  
end
