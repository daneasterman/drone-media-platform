class Flight < ActiveRecord::Base
  before_save :get_video_id

  belongs_to :user
  has_and_belongs_to_many :drones
  belongs_to :camera

  def get_video_id
    regex = /youtube.com.*(?:\/|v=)([^&$]+)/
    self.video_link = self.video_link.match(regex)[1] if self.video_link.match(regex)
  end

    
end
