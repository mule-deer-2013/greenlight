class User < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :name, :sex, :sex_preference, :age, :email, :tagline
  validates :name, :email, :sex, :sex_preference, :age, presence: true
  validates :email, uniqueness: true

=======
  attr_accessible :name, :sex, :sex_preference, :age, :email, :tagline, :oauth_token, :oauth_expires_at, :provider, :uid  
  # validates :name, :email, :sex, :sex_preference, :age, presence: true
  # validates :email, uniqueness: true

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.sex   = auth.extra.raw_info.gender
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
>>>>>>> create_routes
end
