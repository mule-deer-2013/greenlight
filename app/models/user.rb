class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :sex, :sex_preference, :age, :email, :tagline, :password
  validates_presence_of :name, :email, :sex, :sex_preference, :age, :password
  validates_uniqueness_of :email
  

end
