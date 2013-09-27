class User < ActiveRecord::Base
  attr_accessible :name, :sex, :sex_preference, :age, :email, :tagline
  validates :name, :email, :sex, :sex_preference, :age, presence: true
  validates :email, uniqueness: true

end
