class Flight < ActiveRecord::Base
  
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
