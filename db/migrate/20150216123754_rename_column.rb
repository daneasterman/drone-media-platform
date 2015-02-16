class RenameColumn < ActiveRecord::Migration
  def change
    rename_column(:flights, :longitude, :lng)
    rename_column(:flights, :latitude, :lat)
    rename_column(:flights, :location, :formatted_address)  

  end
end
