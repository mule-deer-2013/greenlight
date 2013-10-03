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
  has_many :matches
  has_many :pairs, :through => :matches 
  has_many :recievers, :through => :messages



    # after_create :create_distances
    # after_save :calculate



    def get_potentials_for_user

    if self.sex == 'male'
      if self.sex_preference == "men"
        User.where(sex: "male", sex_preference: "men")
      elsif self.sex_preference == "women"
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


    def calculate
      self.distances.each { |distance| distance.calculate_distance(self.id) }
    end

    def create_distances
      User.all.each do |stranger|
        haversine_distance = Haversine.distance(self.latitude, self.longitude, stranger.latitude, stranger.longitude)
        Distance.create(distance: haversine_distance.to_feet, user_id: self.id, stranger_id: stranger.id)
      end
    end

end


