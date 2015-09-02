class SessionsController < ApplicationController
  
  def new
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
