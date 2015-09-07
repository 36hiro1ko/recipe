class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
        @micropost = current_user.microposts.build
        @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page params[:page]
    end
  end
  
  def sendmail
    if logged_in?
     @recipient_id = params[:recipient_id]
     @mailbox = current_user.mailboxes.build
    end
  end
  
  # --受信メールボックス 
  def inbox
    if logged_in?
      @feed_mails = current_user.feed_mails.includes(:user).order(created_at: :desc).page params[:page]
    end
  end
  
  
end
