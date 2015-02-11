class Drone < ActiveRecord::Base

  has_many :flights

  def model_make
    "#{make} #{model}"
  end

end
