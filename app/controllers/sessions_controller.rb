class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: :create

  def new
  end

  def create
    if params[:session][:email]
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash.now[:danger] = '認証に失敗しました。'
        render :new
      end
    else
      if (user = User.find_or_create_from_auth_hash(auth_hash))
        log_in user
      end
      redirect_to root_path
    end
  end

  def destroy
     # ログイン中の場合のみログアウト処理を実行します。
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_path
  end
end