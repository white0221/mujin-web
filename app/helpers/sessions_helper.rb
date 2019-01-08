module SessionsHelper
  # セッションの発行
  def sign_in(user)
    session[:user_id] = user.id
  end

  # ログイン中のユーザを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ログインしていたらTrue, その他ならFalse
  def signed_in?
    !current_user.nil?
  end

  # ログアウト
  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
end
