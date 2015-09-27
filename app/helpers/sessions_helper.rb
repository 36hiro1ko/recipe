module SessionsHelper
  
  # ログイン中のユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # current_userが存在する場合はtrueを、nilの場合はfalseを返す
  def logged_in?
    !!current_user
  end
  
  #フォワードリーディング
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  #現在ログインしているユーザーは本人か？ 本人であればtureを返す
  def current_user?(user)
    user == current_user #userとcurrent_userが一致していない場合にfalseを返す
  end
  
  
end