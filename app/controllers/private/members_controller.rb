class Private::MembersController < ApplicationController


  def index
    @members = Member.all.page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
  end

  def update
  end
end
