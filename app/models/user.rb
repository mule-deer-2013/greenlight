class User < ActiveRecord::Base
  include BCrypt
  has_secure_password

  attr_accessible :name, :sex, :sex_preference, :age, :email, :tagline, :password, :photo, :longitude, :latitude
  validates_presence_of :name, :email, :sex, :sex_preference, :age
  validates_uniqueness_of :email


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
    has_and_belongs_to_many :votes

    after_create :create_distances
    after_save :calculate

    def get_potentials_for_user
      # we'll do a LEFT OUTER JOIN on the votes table such that
      # we can find users about whom we *haven't* yet voted
      # See: http://www.codinghorror.com/blog/2007/10/a-visual-explanation-of-sql-joins.html
      User.joins("JOIN distances AS d ON users.id = d.stranger_id")
      .joins("LEFT OUTER JOIN votes AS v ON (v.voted_on_id = users.id AND v.voter_id = #{self.id})")
      .where("users.id != ?", self.id)
      .where("v.opinion IS NULL")
      .where(sex: self.sex_preference, sex_preference: self.sex)
      .order("d.distance ASC")
      .limit(1)
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


