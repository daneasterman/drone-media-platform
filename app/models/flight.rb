class Flight < ActiveRecord::Base

  belongs_to :user
  belongs_to :camera

  has_many :drones

    
end
