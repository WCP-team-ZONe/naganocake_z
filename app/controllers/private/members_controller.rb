class Private::MembersController < ApplicationController


  def index
    @members = Member.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end
end
