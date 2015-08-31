class UsersController < ApplicationController
  
  before_action :correct_user, only:[:edit, :update]
  
  def show
    if logged_in?
      @user= User.find(params[:id]);
    else
      flash[:warning] = "このページを閲覧するにはログインが必要です"
      redirect_to login_path
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    #binding.pry
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      #sessionを発行
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id]);
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを変更しました"
      redirect_to @user
    else
      render 'edit'
    end  
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:profile,:address)
  end
  
  #このアクセスはユーザー本人なのかどうかを確認するメソッド
  #ユーザー情報の編集を本人意外行えないようにするための処置
  def correct_user
    @user=User.find(params[:id])
    if current_user?(@user) != true
      session[:user_id] = nil #クッキーの削除
      redirect_to login_path
    end
  end
  
end
