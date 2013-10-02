class Distance < ActiveRecord::Base
  attr_accessible :user_id, :stranger_id, :distance
   # geocoded_by :distance
   # after_create :geocode

  belongs_to :user
  belongs_to :stranger, :class_name => "User"

  def calculate_distance(user_id)

    user = User.find(user_id)
    stranger = self.stranger
    haversine_distance = Haversine.distance(user.latitude, user.longitude, stranger.latitude, stranger.longitude)
    self.distance = haversine_distance.to_feet

  end
end