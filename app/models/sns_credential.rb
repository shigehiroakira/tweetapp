class SnsCredential < ApplicationRecord
  belongs_to :user

  with_options presence: true do
  end
end
