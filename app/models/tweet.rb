class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy


  with_options presence: true do
    validates :image
    validates :text
  end
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
