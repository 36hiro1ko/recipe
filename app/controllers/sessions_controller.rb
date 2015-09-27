class SessionsController < ApplicationController
  
  def new
  end
  
  # twitter等の他サービスからのログインの場合の処理
  def omniauth_callbacks
    # profiderとuidでuserレコードを検索。存在しなければ、新たに作成する
    user = User.find_for_oauth(request.env['omniauth.auth'])
    #binding.pry
    
    # userレコードが既に保存されているか
    if user.persisted?
      session[:user_id] = user.id
      # ログインに成功
      flash.notice = "ログインしました!!"
      redirect_to root_path 
    else
      # ログインに失敗し、サインイン画面に遷移
      flash[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end
  
  def create
    
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      if session[:forwarding_url] != nil
        #本来アクセスしようとしたurlに移動する
        redirect_to session[:forwarding_url]       
      else
        redirect_to root_path
      end
    else
      flash[:danger] = 'メールもしくはパスワードが間違っています'
      render 'new'
    end
    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  
end
