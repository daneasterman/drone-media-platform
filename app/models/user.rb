class User < ActiveRecord::Base

  has_many :flights
  has_many :drones 


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable

  def role?(role_to_compare)
      self.role.to_s == role_to_compare.to_s
  end

end
