class Event < ApplicationRecord
  belongs_to :hobby
  has_one :creator 
end
