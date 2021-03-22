class Public::AddressesController < ApplicationController

  before_action :authenticate_member!

  def index
    @addresses  =  current_member.addresses
  	@address  =  Address.new
  end

  def edit
  end

  def create
    @address  =  Address.new(address_params)
	  @address.member_id  =  current_member.id
    @addresses  =  current_member.address
	  @address.save
	  redirect_back(fallback_location: root_path)
  end

  def update
  end

  def destroy
    @address  =  Address.find(params[:id])
    @address.destroy
    @addresses  =  current_member.address
	  redirect_back(fallback_location: root_path)
  end

  private

	def address_params
  	params.require(:address).permit(:postal_code, :address, :name)
  end

end
