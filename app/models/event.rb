class Event < ApplicationRecord
  belongs_to :hobby
  has_one :creator
  has_many :attendees, :through => :usersevent
end
