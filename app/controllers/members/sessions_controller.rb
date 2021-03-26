# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  protected

  def reject_member
    @member = Member.find_by(email: params[:member][:email].downcase)
    if @member
      if (@member.valid_password?(params[:member][:password]) && (@member.active_for_authentication? == false))
        flash[:notice] = "退会済みです。"
        redirect_to new_member_session_path
      end
    else
      flash[:notice] = "必須項目を入力してください。"
    end
  end
end
