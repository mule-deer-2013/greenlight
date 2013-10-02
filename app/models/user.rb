class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :sex, :sex_preference, :age, :email, :tagline, :password, :photo, :longitude, :latitude
  validates_presence_of :name, :email, :sex, :sex_preference, :age, :password
  validates_uniqueness_of :email

  has_attached_file :photo,
  :styles => {
    :medium => "400x400"
  },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => ":attachment/:id/:style.:extension",
  :bucket => "greenlight"


  has_and_belongs_to_many :votes


  has_and_belongs_to_many :votes

  def get_potentials_for_user
  
    if self.sex == 'male'
      if self.sex_preference == "men"
        User.where(sex: "male", sex_preference: "men") 
      elsif self.sex_preference == "female"
        User.where(sex: "female", sex_preference: "men")
      elsif self.sex_preference == "both"
        User.where(sex_preference: "men") && User.where(sex_preference: "women")
      end
    else
      if self.sex_preference == "men"
        User.where(sex: "male", sex_preference: "women")
      elsif self.sex_preference == "women"
        User.where(sex: "female", sex_preference: "women")
      elsif self.sex_preference == "both"
        User.where(sex_preference: "men") && User.where(sex_preference: "women")
      end
    end
  end
end

