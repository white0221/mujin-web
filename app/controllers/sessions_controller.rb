class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to '/user/menu'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # logedin
      flash[:success] = "Welcome to MUJIN website"
      sign_in user
      redirect_to '/user/list'
    else
      # login err
      flash[:danger] = "Invaid email or password"
      redirect_to '/signin'
    end
  end

  def destroy
    sign_out
    redirect_to '/signin'
  end
end
