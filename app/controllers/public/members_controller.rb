class Public::MembersController < ApplicationController

  before_action :authenticate_member!#ログインユーザのみ実行

  def out
    @member = current_member
    @member.update(is_deleted: true )
    reset_session #ログアウトさせる
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
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
