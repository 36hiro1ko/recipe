class Mailbox < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :recipient_id, presence: true
  validates :message, presence: true, length: { maximum: 300 }
  
  
end
