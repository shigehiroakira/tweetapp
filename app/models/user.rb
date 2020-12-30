class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable,omniauth_providers:[:facebook,:twitter,:google_oauth2]

  has_many :sns_credential

  def self.from_omniauth(auth)
   sns = SnsCredential.where(provider: auth.provider,uid: auth.uid).first_or_create
   user = User.where(email: auth.info.email,nickname: auth.info.name).first_or_initialize
   if user.persisted?
    sns.user = user
    sns.save
   end
   return user
  end
end
