class Private::OrderedProductsController < ApplicationController

  def update
      @ordered_product = OrderedProduct.find(params[:id])
      @order = @ordered_product.order
      @ordered_product.update(ordered_product_params)

      if @ordered_product.production_status == "製作中"
          @order.update(order_status: 2)

      elsif @order.ordered_products.count == @order.ordered_products.where(production_status: 3).count
          @order.update(order_status: 3)
      end

    flash[:notice] = "製作ステータスを更新しました"
    redirect_to private_order_path(@ordered_product.order)
  end

  private

  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end

end