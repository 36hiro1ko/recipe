class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿されました"
      #redirect_to root_url
      redirect_to request.referrer || root_url # request.referrer 遷移元URLを取得する
    else
      flash[:alert] = "投稿に失敗しました"
      #@feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page params[:page]
      #render 'static_pages/home'
      redirect_to request.referrer || root_url # request.referrer 遷移元URLを取得する
    end
  end
  
  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "投稿は削除されました"
    redirect_to request.referrer || root_url # request.referrer 遷移元URLを取得する
  end
  

  private
  def micropost_params
    params.require(:micropost).permit(:content,:image,:image_cache)
  end
  
end
