class Private::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to request.referer
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :ex_price, )
  end
end
