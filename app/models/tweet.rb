class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  with_options presence: true do
  validates :image
  validates :text
  end
  mount_uploader :image, ImageUploader

end
