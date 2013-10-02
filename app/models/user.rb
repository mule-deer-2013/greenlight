class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  attr_accessible :name, :sex, :sex_preference, :age, :email, :tagline, :password, :photo, :longitude, :latitude
  # validates_presence_of :name, :email, :sex, :sex_preference, :age, :password
  # validates_uniqueness_of :email

  has_attached_file :photo,
  :styles => {
    :medium => "400x400"
  },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => ":attachment/:id/:style.:extension",
  :bucket => "greenlight"

  has_and_belongs_to_many :votes

end
