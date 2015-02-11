class Flight < ActiveRecord::Base
  before_save :get_video_id

  belongs_to :user
  belongs_to :drones
  belongs_to :cameras

  def get_video_id
    regex = /youtube.com.*(?:\/|v=)([^&$]+)/
    self.video_link = self.video_link.match(regex)[1]
    # url = video_link
  end

    
end
