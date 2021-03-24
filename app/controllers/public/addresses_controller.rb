class Public::AddressesController < ApplicationController

  before_action :authenticate_member!

  def index
    @addresses  =  current_member.addresses
  	@address  =  Address.new
  end

  def edit
    @address  =  Address.find(params[:id])
  end

  def create
    @address  =  Address.new(address_params)
	  @address.member_id  =  current_member.id
    @addresses  =  current_member.address
	  @address.save
	  flash[:notice] = "配送先を登録しました！"
	  redirect_back(fallback_location: root_path)
  end

  def update
    @address  =  Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を編集しました！"
      redirect_to addresses_path
    else
      render "edit"
    end
  end

  def destroy
    @address  =  Address.find(params[:id])
    @address.destroy
    @addresses  =  current_member.address
    flash[:notice] = "配送先を削除しました！"
	  redirect_back(fallback_location: root_path)
  end

  private

	def address_params
  	params.require(:address).permit(:postal_code, :address, :name)
  end
end
