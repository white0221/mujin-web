class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザを登録しました。"
      redirect_to '/'
    else
      flash[:danger] = "入力エラーです。"
      redirect_to '/signup'
    end
  end
  
  def list
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
  end
  
  def upgrade
    @user = User.find(params[:data])
    @user.user_name = params[:user][:user_name]
    @user.email = params[:user][:email]
    if @user.save
      #success
      p 'update ok'
    else
      #err
      p 'update err'
    end
    redirect_to '/user/list'
  end

  def destroy
    # User.find(params[:data]).destroy
    redirect_to '/user/list'
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:user_name, :email)
    end
end