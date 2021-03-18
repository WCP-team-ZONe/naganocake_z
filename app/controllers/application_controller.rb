class ApplicationController < ActionController::Base

  # 消費税
  def set_tax
    @tax = 1.1
  end
end
