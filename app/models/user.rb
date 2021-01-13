class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, uniqueness: true
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな・カタカナ・漢字で入力してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
    validates :password
  end

  has_many :sns_credential
  has_many :tweets
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy 
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy 
  has_many :following_user, through: :follower, source: :followed 
  has_many :follower_user, through: :followed, source: :follower 
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す、後ほどcontrollerで使用します。
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す、後ほどviewで使用します。
  def following?(user)
    following_user.include?(:user)
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email, nickname: auth.info.name).first_or_initialize
    if user.persisted?
      sns.user = user
      sns.save
    end
    user
  end

  def already_favorited?(tweet)
    favorites.exists?(tweet_id: tweet.id)
  end
end
