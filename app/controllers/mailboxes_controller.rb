class MailboxesController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def create
    @mailbox = current_user.mailboxes.build(mailbox_params)
    @mailbox.read = 0 #既読フラグに0を代入
    if @mailbox.save
      flash[:success] = "ショートメールを送りました"
      redirect_to root_path
    else
      flash[:success] = "メールの送信に失敗しました"
      redirect_to root_path
    end
  end

  private
  def mailbox_params
    params.require(:mailbox).permit(:message, :recipient_id)
  end
end
