class Drone < ActiveRecord::Base

  has_and_belongs_to_many :flights

  def model_make
    "#{make} #{model}"
  end

end
