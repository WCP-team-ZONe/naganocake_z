class Private::MembersController < ApplicationController

  PER = 3

  def index
    @members = Member.all
    @members_page = Member.page(params[:pame]).per(PER)
  end

  def show
  end

  def edit
  end

  def update
  end
end
