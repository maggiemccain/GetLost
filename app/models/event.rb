class Event < ApplicationRecord
  belongs_to :hobby
  has_one :creator
  has_many :usersevent
  has_many :users, :through => :usersevent
end
