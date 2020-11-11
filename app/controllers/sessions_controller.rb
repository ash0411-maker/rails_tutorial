class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log_inメソッド（session[:user_id]にuser.idを代入）
      log_in user
      #詳細画面にリダイレクト
      redirect_back_or user
    else
      flash.now[:danger] = t('.login_error')
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
