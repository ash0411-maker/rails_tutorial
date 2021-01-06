module SessionsHelper
  def log_in(user)
    # sessionメソッドで作成された一時cookiesは、ブラウザを閉じた瞬間に有効期限が終了
    session[:user_id] = user.id #sessionコントローラーとは無関係
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
