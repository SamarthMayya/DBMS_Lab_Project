class User < ApplicationRecord
  has_secure_password

  has_one :account
  has_many :transactions
  mount_uploader :photo, PhotoUploader # Tells rails to use this uploader for this model.
  mount_uploader :sign, SignUploader # Tells rails to use this uploader for this model.
  validates :username, presence: true, uniqueness: true# Make sure the owner's name is present. 
  validates :dob_should_be_more_than_minimum 
  
  def dob_should_be_more_than_minimum 
    if ((Time.zone.now - dob.to_time) / 1.year.seconds).floor < 18 
      errors.add(:age, "should be more than 18 years for registering") 
    end 
  end 
end
