class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :sex, :sex_preference, :age, :email, :tagline, :password, :photo, :longitude, :latitude
  validates_presence_of :name, :email, :sex, :sex_preference, :age, :password_digest
  validates_uniqueness_of :email
  # # geocoded_by :latitude, :longitude
  # after_create :geocode


  has_attached_file :photo,
  :styles => {
    :medium => "400x400"
    },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => "greenlight"

    has_many :distances
    has_many :strangers, :through => :distances

    after_create :create_distances
    after_save :calculate




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


