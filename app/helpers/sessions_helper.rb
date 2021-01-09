module SessionsHelper

  def log_in(user)
    # sessionメソッドで作成された一時cookiesは、ブラウザを閉じた瞬間に有効期限が終了
    session[:user_id] = user.id #sessionコントローラーとは無関係
  end

  # ユーザーのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user?(user)
    user =! current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #記憶したURLにリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  # リクエストで送られてきたURLをsession変数の:forwarding_urlキーに格納。
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
