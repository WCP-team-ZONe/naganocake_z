class Private::ProductsController < ApplicationController
  # before_action :authenticate_admin_user!

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to  private_product_path(@product.id), success: "登録に成功しました"
    else
      render "new", denger: "登録に失敗しました"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to private_product_path(@product.id)
    else
      render "edit"
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :ex_price, :is_active, :image, :genre_id)
    end
end

