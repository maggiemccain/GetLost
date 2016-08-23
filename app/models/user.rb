class User < ApplicationRecord
  has_secure_password
  has_many :usersevent
  has_many :events, :through => :usersevent
end
