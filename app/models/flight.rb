class Flight < ActiveRecord::Base

  belongs_to :user

  has_one :drone
  has_one :camera
  
end
