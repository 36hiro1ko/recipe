class User < ActiveRecord::Base
  has_many :microposts
  
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    on: :create
  

  has_secure_password
  
  # 「dependent: :destroy」userが削除された場合に一緒に削除する
  has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  
  has_many :follower_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower
  
  
  
  # ---- ダイレクトメール ---------------
  has_many :mailboxes
  
  # 受信メール一覧を取得
  def feed_mails
     Mailbox.where(recipient_id: [self.id])
  end
  # -------------------------------------
    
    # 他のユーザーをフォローする
  def follow(other_user)
    following_relationships.create(followed_id: other_user.id)
  end

  # フォローしているユーザーをアンフォローする
  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end

  # あるユーザーをフォローしているかどうか？
  def following?(other_user)
    following_users.include?(other_user)
  end
  
  #自分とフォローしているユーザーのつぶやきを取得する
  def feed_items
    Micropost.where(user_id: following_user_ids + [self.id])
  end
  
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        name:     auth.info.nickname,
        image_url: auth.info.image,
        provider: auth.provider,
        # twitterではemailを取得できないので、適当に一意のemailを生成
        email:   SecureRandom.urlsafe_base64 + "@example.com",
        # twitterではpasswordが取得できないので、適当にパスワードを生成
        password_digest:  SecureRandom.urlsafe_base64
      )
    end

    user
  end
 
end