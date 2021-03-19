class Public::MembersController < ApplicationController
  def out
  end

  def withdraw
  end

  def show
    @member = current_member
  end

  def update
    @member = current_member
      if @member.update(member_params)
        redirect_to member_path
      else
        render :edit
      end
  end

  def edit
    @member = current_member
  end

  private
  def member_params
    params.require(:member).permit(:family_name, :first_name, :family_kana, :first_kana, :postal_code, :address, :phone_number, :email,)
  end

end
