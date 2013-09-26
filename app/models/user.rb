class User < ActiveRecord::Base
  validates :name, :email, :sex, :sex_preference, :age, presence: true
  validates :email, uniqueness: true

end
