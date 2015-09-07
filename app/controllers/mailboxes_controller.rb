class MailboxesController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def create
    @mailbox = current_user.mailboxes.build(mailbox_params)
    if @mailbox.save
      flash[:success] = "ダイレクトメールを送りました"
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
