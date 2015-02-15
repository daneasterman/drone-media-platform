class Flight < ActiveRecord::Base
  include AutoHtmlFor
  
  belongs_to :user
  belongs_to :camera

  has_many :drones

  auto_html_for :video_link do
    html_escape
    youtube(:width => 600, :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end


end
