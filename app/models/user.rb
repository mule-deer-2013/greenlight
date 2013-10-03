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
      all_potentials = User.joins('JOIN distances AS d ON users.id = d.stranger_id')
      .where('users.id != ?', self.id)
      .where(sex: self.sex_preference, sex_preference: self.sex)
      .order('d.distance DESC')
      # potentials = []
      # all_potentials.each do |user|
      #   # ensure that self.id and user.id are not in the votes table together, if they're not
      #   user.votes.each do |vote|
      #     if self.id != vote.user_id
      #       potentials << user
      #     end
      #   end
      # end 
      # p potentials 
      # potentials
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


