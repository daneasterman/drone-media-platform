class AddLongitudeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :longitude, :float
  end
end
