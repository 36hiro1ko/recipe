class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
        @micropost = current_user.microposts.build
        @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
  
  def sendmail
    if logged_in?
     @recipient_id = params[:recipient_id]
     @mailbox = current_user.mailboxes.build
    end
  end
  
  
end
