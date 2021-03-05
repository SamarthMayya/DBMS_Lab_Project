class User < ApplicationRecord
  has_secure_password

  has_one :account

  mount_uploader :photo, PhotoUploader # Tells rails to use this uploader for this model.
  mount_uploader :sign, SignUploader # Tells rails to use this uploader for this model.
  validates :username, presence: true, uniqueness: true# Make sure the owner's name is present.
end
