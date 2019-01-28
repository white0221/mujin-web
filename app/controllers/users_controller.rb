# coding: utf-8

require 'aws-sdk'

Aws.config.update({
                    credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY"], ENV["AWS_ACCESS_SECRET"])
                  })

class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  def new
    @user = User.new
  end

  def create
    user_image_path = user_params[1]["face_image_file"].tempfile.path
    @user = User.new(user_params[0])

    success = false
    User.transaction do
      @user.save
      s3 = Aws::S3::Resource.new(region: ENV["AWS_REGION"])
      obj = s3.bucket(ENV["AWS_S3_BUCKET"]).object('RegistImage/'+@user.id.to_s+'_'+user_params[0][:user_name]+'.png')
      obj.upload_file(user_image_path)

      success = true
    end

    if success
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

	def tablet
		response_json = {}
		users = User.all
		response_json["user"] = users
		render json: response_json, status: :accepted
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
      [params.require(:user).permit(:user_name, :email, :password, :password_confirmation), params.require(:fileupload).permit(:face_image_file)]
    end

    def update_params
      params.require(:user).permit(:user_name, :email)
    end
end
