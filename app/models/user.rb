class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable,omniauth_providers:[:facebook,:twitter,:google_oauth2]
         
         with_options presence: true do
          validates :nickname
          validates :birthday
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
