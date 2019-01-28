class ApplicationController < ActionController::Base
  include SessionsHelper
  def signed_in_user
      unless signed_in?
        flash[:danger] = "Please sign in."
        redirect_to '/signin'
      end
  end

  def admin_user
    redirect_to('/item/list') unless current_user.admin_flag?
  end
end
