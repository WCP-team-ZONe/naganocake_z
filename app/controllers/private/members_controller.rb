class Private::MembersController < ApplicationController
   before_action :authenticate_admin!


  def index
    @members = Member.all.page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
      if @member.update(member_params)
         flash[:notice] = "会員情報を変更しました"
        redirect_to private_member_path(@member)
      else
        render "edit"
      end
  end

  private

  def member_params
    params.require(:member).permit(:family_name,:first_name,:family_kana,:first_kana,:postal_code,:address,:phone_namber,:email,:is_deleted)
  end
end