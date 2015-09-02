class UsersController < ApplicationController
  
  before_action :correct_user, only:[:edit, :update]
  before_action :logged_in_ok?, only:[:show, :followers, :followings]
  
  def show
      @user= User.find(params[:id])
      @microposts = @user.microposts
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
  
  #フォロー一覧
  def followings
      @user = User.find(params[:id])
      @follwing_users = @user.following_users
  end
  
  #フォロワー一覧
  def followers
      @user = User.find(params[:id])
      @follower_users = @user.follower_users
  end
  
  
  #ログインしているかどうか確認し、ログインしていない場合はログイン画面に戻す
  def logged_in_ok?
    unless logged_in?
      flash[:warning] = "このページを閲覧するにはログインが必要です"
      store_location
      redirect_to login_path
    end
  end
   
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:profile,:address)
  end
  
  #ログインしているユーザーが本人なのかどうかを確認する
  #ユーザー情報の編集を本人意外行えないようにするための処置
  def correct_user
    #correct_user?関数はapplication_controllerに実装
    correct_user?(params[:id])
  end
  

  
end
