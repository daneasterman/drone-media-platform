class Flight < ActiveRecord::Base

  mount_uploader :flight_image, FlightImageUploader

  validates :formatted_address, presence: true
  validates :video_link, presence: true
  validates :drone, presence: true
  validates :camera, presence: true
  # validate { errors.add(:base, 'You must upload a satellite flight image to continue') if flight_image.blank? }
  
  belongs_to :user
  belongs_to :camera
  belongs_to :drone

  auto_html_for :video_link do
    html_escape
    youtube(:width => 560, :height => 310, :autoplay => false)
    # Below doesn't do anything.
    #vimeo(:width => 600, :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end


end
