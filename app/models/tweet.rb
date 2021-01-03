class Tweet < ApplicationRecord
  belongs_to :user

  with_options presence: true do
  validates :image
  validates :text
  end
  mount_uploader :image, ImageUploader

end
