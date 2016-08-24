class Event < ApplicationRecord
  belongs_to :hobby
  has_many :usersevent
  has_many :users, :through => :usersevent



  validates :listing, presence:true, allow_blank: false
  validates :location, presence:true, allow_blank: false
  validates :date, presence:true, allow_blank: false

  # reverse_geocoded_by :latitude, :longitude,
  #   :address => :location
  # after_validation :reverse_geocode

end
