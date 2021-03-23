class Private::OrderedProductsController < ApplicationController

  def update
      @ordered_product = OrderedProduct.find(params[:id])
    if @ordered_product.update(ordered_product_params)
    flash[:notice] = "注文ステータスを更新しました"
    redirect_to private_order_path(@ordered_product.order)
    else
    render show
    end
  end

  private

  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end

end