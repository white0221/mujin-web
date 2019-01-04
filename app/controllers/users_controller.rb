class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      flash[:danger] = "入力エラーです。"
      redirect_to '/signup'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end
end