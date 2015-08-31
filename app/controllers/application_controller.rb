class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  def correct_user?(id)
    @user=User.find(id)
    if current_user?(@user) != true
      session[:user_id] = nil #クッキーの削除
      redirect_to login_path
    end
  end

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  
   
end
