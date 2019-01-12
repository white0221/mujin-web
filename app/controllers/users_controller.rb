class UsersController < ApplicationController
  #before_action :authenticate_customer!, only: [:upgrade, :destroy, :signined]
  before_action :signed_in_user
  before_action :admin_user

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
    user = User.find(params[:data])
    user.user_name = params[:user][:user_name]
    user.email = params[:user][:email]
    if user.save(validate: false)
      #success
      p 'update ok'
    else
      #err
      p 'update err'
    end
    flash[:notice] = "#{user.user_name}さんの情報を更新しました。"
    redirect_to '/user/list'
  end

  def destroy
    user = User.find(params[:user_id]).destroy
    flash[:notice] = "#{user.user_name}さんを削除しました。"
    redirect_to '/user/list'
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:user_name, :email)
    end

    def signed_in_user
      unless signed_in?
        flash[:danger] = "Please sign in."
        redirect_to '/signin'
      end
    end

    def admin_user
      redirect_to('/list') unless current_user.admin_flag?
    end
end
